#include <assert.h>
#include <immintrin.h>
#include "xnnpack/gemm.h"

void xnn_f32_gemm_minmax_ukernel_5x16c2__fma3_broadcast(
    size_t mr,
    size_t nc,
    size_t kc,
    const float* restrict a,
    size_t a_stride,
    const float* restrict w,
    float* restrict c,
    size_t cm_stride,
    size_t cn_stride,
    const union xnn_f32_minmax_params params[restrict XNN_MIN_ELEMENTS(1)])
{
  assert(mr != 0);
  assert(mr <= 5);
  assert(nc != 0);
  assert(kc != 0);
  assert(kc % sizeof(float) == 0);
  assert(a != NULL);
  assert(w != NULL);
  assert(c != NULL);

  const float* a0 = a;
  float* c0 = c;
  const float* a1 = (const float*) ((uintptr_t) a0 + a_stride);
  float* c1 = (float*) ((uintptr_t) c0 + cm_stride);
  if XNN_UNPREDICTABLE(mr < 2) {
    a1 = a0;
    c1 = c0;
  }
  const float* a2 = (const float*) ((uintptr_t) a1 + a_stride);
  float* c2 = (float*) ((uintptr_t) c1 + cm_stride);
  if XNN_UNPREDICTABLE(mr <= 2) {
    a2 = a1;
    c2 = c1;
  }
  const float* a3 = (const float*) ((uintptr_t) a2 + a_stride);
  float* c3 = (float*) ((uintptr_t) c2 + cm_stride);
  if XNN_UNPREDICTABLE(mr < 4) {
    a3 = a2;
    c3 = c2;
  }
  const float* a4 = (const float*) ((uintptr_t) a3 + a_stride);
  float* c4 = (float*) ((uintptr_t) c3 + cm_stride);
  if XNN_UNPREDICTABLE(mr <= 4) {
    a4 = a3;
    c4 = c3;
  }

  const __m256 vmin = _mm256_set1_ps(params->scalar.min);
  const __m256 vmax = _mm256_set1_ps(params->scalar.max);
  XNN_FORCE_REALIZATION(vmin);
  XNN_FORCE_REALIZATION(vmax);

  do {
    // 初始化部分累加器
    __m256 vacc0x01234567 = _mm256_load_ps(w + 0);
    __m256 vacc1x01234567 = vacc0x01234567;
    __m256 vacc2x01234567 = vacc0x01234567;
    __m256 vacc3x01234567 = vacc0x01234567;
    __m256 vacc4x01234567 = vacc0x01234567;
    w += 8;
    
    size_t k = kc;
    while (k >= 2 * sizeof(float)) {
      // 广播64位到寄存器 todo
      // const __m256 va0 = _mm256_broadcast_ps((const __m128*) a0);
      // a0 += 2;
      // const __m256 va1 = _mm256_broadcast_ps((const __m128*) a1);
      // a1 += 2;
      // const __m256 va2 = _mm256_broadcast_ps((const __m128*) a2);
      // a2 += 2;
      // const __m256 va3 = _mm256_broadcast_ps((const __m128*) a3);
      // a3 += 2;
      // const __m256 va4 = _mm256_broadcast_ps((const __m128*) a4);
      // a4 += 2;

      // 从 a0 加载 64 位（2 个 float）
      __m128 va0_2f = _mm_loadl_pi(_mm_setzero_ps(), (__m64*) a0);
      // 将 a0 中的 64 位广播到 256 位寄存器
      __m256 va0 = _mm256_broadcast_ps(&va0_2f);
      a0 += 2;
      __m128 va1_2f = _mm_loadl_pi(_mm_setzero_ps(), (__m64*) a1);
      __m256 va1 = _mm256_broadcast_ps(&va1_2f);
      a1 += 2;

      __m128 va2_2f = _mm_loadl_pi(_mm_setzero_ps(), (__m64*) a2);
      __m256 va2 = _mm256_broadcast_ps(&va2_2f);
      a2 += 2;

      __m128 va3_2f = _mm_loadl_pi(_mm_setzero_ps(), (__m64*) a3);
      __m256 va3 = _mm256_broadcast_ps(&va3_2f);
      a3 += 2;

      __m128 va4_2f = _mm_loadl_pi(_mm_setzero_ps(), (__m64*) a4);
      __m256 va4 = _mm256_broadcast_ps(&va4_2f);
      a4 += 2;

      // 加载权重
      const __m256 vb01234567 = _mm256_load_ps(w);
      const __m256 vb89ABCDEF = _mm256_load_ps(w + 8);
      w += 16;

      // do multiple
      vacc0x01234567 = _mm256_fmadd_ps(va0, vb01234567, vacc0x01234567);
      vacc1x01234567 = _mm256_fmadd_ps(va1, vb01234567, vacc1x01234567);
      vacc2x01234567 = _mm256_fmadd_ps(va2, vb01234567, vacc2x01234567);
      vacc3x01234567 = _mm256_fmadd_ps(va3, vb01234567, vacc3x01234567);
      vacc4x01234567 = _mm256_fmadd_ps(va4, vb01234567, vacc4x01234567);

      k -= 2 * sizeof(float);
    }

    if (k != 0) {
      // 剩余不足 2 个32位的 a 元素
      __m128 va0_partial = _mm_setzero_ps();
      __m128 va1_partial = _mm_setzero_ps();
      __m128 va2_partial = _mm_setzero_ps();
      __m128 va3_partial = _mm_setzero_ps();
      __m128 va4_partial = _mm_setzero_ps();

      // 加载剩余的 a 元素并填充 0
      if (k >= sizeof(float)) {
        va0_partial = _mm_load_ss(a0);
        va1_partial = _mm_load_ss(a1);
        va2_partial = _mm_load_ss(a2);
        va3_partial = _mm_load_ss(a3);
        va4_partial = _mm_load_ss(a4);
      }

      // 广播填充后的 va
      const __m256 va0 = _mm256_broadcast_ps((const __m128*) &va0_partial);
      const __m256 va1 = _mm256_broadcast_ps((const __m128*) &va1_partial);
      const __m256 va2 = _mm256_broadcast_ps((const __m128*) &va2_partial);
      const __m256 va3 = _mm256_broadcast_ps((const __m128*) &va3_partial);
      const __m256 va4 = _mm256_broadcast_ps((const __m128*) &va4_partial);

      // 加载权重
      const __m256 vb01234567 = _mm256_load_ps(w);
      const __m256 vb89ABCDEF = _mm256_load_ps(w + 8);

      // 进行乘法累加
      vacc0x01234567 = _mm256_fmadd_ps(va0, vb01234567, vacc0x01234567);
      vacc1x01234567 = _mm256_fmadd_ps(va1, vb01234567, vacc1x01234567);
      vacc2x01234567 = _mm256_fmadd_ps(va2, vb01234567, vacc2x01234567);
      vacc3x01234567 = _mm256_fmadd_ps(va3, vb01234567, vacc3x01234567);
      vacc4x01234567 = _mm256_fmadd_ps(va4, vb01234567, vacc4x01234567);
    }

    // 进行水平加法，将两个 a 的结果相加
    vacc0x01234567 = _mm256_hadd_ps(vacc0x01234567, vacc0x01234567);
    vacc1x01234567 = _mm256_hadd_ps(vacc1x01234567, vacc1x01234567);
    vacc2x01234567 = _mm256_hadd_ps(vacc2x01234567, vacc2x01234567);
    vacc3x01234567 = _mm256_hadd_ps(vacc3x01234567, vacc3x01234567);
    vacc4x01234567 = _mm256_hadd_ps(vacc4x01234567, vacc4x01234567);

    // 应用激活函数的最小值和最大值
    vacc0x01234567 = _mm256_max_ps(vmin, vacc0x01234567);
    vacc0x01234567 = _mm256_min_ps(vmax, vacc0x01234567);

    vacc1x01234567 = _mm256_max_ps(vmin, vacc1x01234567);
    vacc1x01234567 = _mm256_min_ps(vmax, vacc1x01234567);

    vacc2x01234567 = _mm256_max_ps(vmin, vacc2x01234567);
    vacc2x01234567 = _mm256_min_ps(vmax, vacc2x01234567);

    vacc3x01234567 = _mm256_max_ps(vmin, vacc3x01234567);
    vacc3x01234567 = _mm256_min_ps(vmax, vacc3x01234567);

    vacc4x01234567 = _mm256_max_ps(vmin, vacc4x01234567);
    vacc4x01234567 = _mm256_min_ps(vmax, vacc4x01234567);

    // 存储结果
    if XNN_LIKELY(nc >= 16) {
      _mm256_storeu_ps(c0, vacc0x01234567);
      c0 = (float*) ((uintptr_t) c0 + cn_stride);
      _mm256_storeu_ps(c1, vacc1x01234567);
      c1 = (float*) ((uintptr_t) c1 + cn_stride);
      _mm256_storeu_ps(c2, vacc2x01234567);
      c2 = (float*) ((uintptr_t) c2 + cn_stride);
      _mm256_storeu_ps(c3, vacc3x01234567);
      c3 = (float*) ((uintptr_t) c3 + cn_stride);
      _mm256_storeu_ps(c4, vacc4x01234567);
      c4 = (float*) ((uintptr_t) c4 + cn_stride);

      a0 = (const float*) ((uintptr_t) a0 - kc);
      a1 = (const float*) ((uintptr_t) a1 - kc);
      a2 = (const float*) ((uintptr_t) a2 - kc);
      a3 = (const float*) ((uintptr_t) a3 - kc);
      a4 = (const float*) ((uintptr_t) a4 - kc);

      nc -= 16;
    } else {
      if (nc & 8) {
        _mm256_storeu_ps(c0, vacc0x01234567);
        _mm256_storeu_ps(c1, vacc1x01234567);
        _mm256_storeu_ps(c2, vacc2x01234567);
        _mm256_storeu_ps(c3, vacc3x01234567);
        _mm256_storeu_ps(c4, vacc4x01234567);

        c0 += 8;
        c1 += 8;
        c2 += 8;
        c3 += 8;
        c4 += 8;
      }
      __m128 vacc0x0123 = _mm256_castps256_ps128(vacc0x01234567);
      __m128 vacc1x0123 = _mm256_castps256_ps128(vacc1x01234567);
      __m128 vacc2x0123 = _mm256_castps256_ps128(vacc2x01234567);
      __m128 vacc3x0123 = _mm256_castps256_ps128(vacc3x01234567);
      __m128 vacc4x0123 = _mm256_castps256_ps128(vacc4x01234567);
      if (nc & 4) {
        _mm_storeu_ps(c0, vacc0x0123);
        _mm_storeu_ps(c1, vacc1x0123);
        _mm_storeu_ps(c2, vacc2x0123);
        _mm_storeu_ps(c3, vacc3x0123);
        _mm_storeu_ps(c4, vacc4x0123);

        vacc0x0123 = _mm256_extractf128_ps(vacc0x01234567, 1);
        vacc1x0123 = _mm256_extractf128_ps(vacc1x01234567, 1);
        vacc2x0123 = _mm256_extractf128_ps(vacc2x01234567, 1);
        vacc3x0123 = _mm256_extractf128_ps(vacc3x01234567, 1);
        vacc4x0123 = _mm256_extractf128_ps(vacc4x01234567, 1);

        c0 += 4;
        c1 += 4;
        c2 += 4;
        c3 += 4;
        c4 += 4;
      }
      if (nc & 2) {
        _mm_storel_pi((__m64*) c0, vacc0x0123);
        _mm_storel_pi((__m64*) c1, vacc1x0123);
        _mm_storel_pi((__m64*) c2, vacc2x0123);
        _mm_storel_pi((__m64*) c3, vacc3x0123);
        _mm_storel_pi((__m64*) c4, vacc4x0123);

        vacc0x0123 = _mm_movehl_ps(vacc0x0123, vacc0x0123);
        vacc1x0123 = _mm_movehl_ps(vacc1x0123, vacc1x0123);
        vacc2x0123 = _mm_movehl_ps(vacc2x0123, vacc2x0123);
        vacc3x0123 = _mm_movehl_ps(vacc3x0123, vacc3x0123);
        vacc4x0123 = _mm_movehl_ps(vacc4x0123, vacc4x0123);

        c0 += 2;
        c1 += 2;
        c2 += 2;
        c3 += 2;
        c4 += 2;
      }
      if (nc & 1) {
        _mm_store_ss(c0, vacc0x0123);
        _mm_store_ss(c1, vacc1x0123);
        _mm_store_ss(c2, vacc2x0123);
        _mm_store_ss(c3, vacc3x0123);
        _mm_store_ss(c4, vacc4x0123);
      }

      // 将 nc 设为 0，以结束循环
      nc = 0;
    }
  } while (nc != 0);
}
