// Copyright 2024 Google LLC
//
// This source code is licensed under the BSD-style license found in the
// LICENSE file in the root directory of this source tree.
//

#ifndef THIRD_PARTY_XNNPACK_INCLUDE_SIMD_F32_HVX_H_
#define THIRD_PARTY_XNNPACK_INCLUDE_SIMD_F32_HVX_H_

#include <stddef.h>

#include <hvx_hexagon_protos.h>
#include <hexagon_protos.h>
#include <hexagon_types.h>
#include <xnnpack/common.h>
#include <xnnpack/intrinsics-polyfill.h>


// SIMD vector type for f32 using HVX.
typedef HVX_Vector xnn_simd_f32_t;
#define xnn_simd_size_f32 32
#define xnn_simd_log2_size_f32 5
#define xnn_simd_bytes_f32 xnn_simd_size_f32 * sizeof(float)

#define XNN_SIMD_CONST_F32(var, val) \
  const xnn_simd_f32_t var = Q6_V_vsplat_R(val);

#define XNN_SIMD_CONST_U32(var, val) const HVX_Vector var = Q6_V_vsplat_R(val);

// Whether or not this architecture has native fused multiply-add support.
#define XNN_SIMD_HAS_NATIVE_FMA 1

// Arithmetic operations.

static XNN_INLINE xnn_simd_f32_t xnn_zero_f32() { return Q6_V_vsplat_R(0); }

static XNN_INLINE xnn_simd_f32_t xnn_add_f32(xnn_simd_f32_t a,
                                             xnn_simd_f32_t b) {
  return Q6_Vsf_vadd_VsfVsf(a, b);
}

static XNN_INLINE xnn_simd_f32_t xnn_mul_f32(xnn_simd_f32_t a,
                                             xnn_simd_f32_t b) {
  return Q6_Vsf_vmpy_VsfVsf(a, b);
}

static XNN_INLINE xnn_simd_f32_t xnn_fmadd_f32(xnn_simd_f32_t a,
                                               xnn_simd_f32_t b,
                                               xnn_simd_f32_t c) {
  return Q6_Vsf_vadd_VsfVsf(c, Q6_Vsf_vmpy_VsfVsf(a, b));
}

static XNN_INLINE xnn_simd_f32_t xnn_fnmadd_f32(xnn_simd_f32_t a,
                                                xnn_simd_f32_t b,
                                                xnn_simd_f32_t c) {
  return Q6_Vsf_vsub_VsfVsf(c, Q6_Vsf_vmpy_VsfVsf(a, b));
}

static XNN_INLINE xnn_simd_f32_t xnn_sub_f32(xnn_simd_f32_t a,
                                             xnn_simd_f32_t b) {
  return Q6_Vsf_vsub_VsfVsf(a, b);
}

static XNN_INLINE xnn_simd_f32_t xnn_max_f32(xnn_simd_f32_t a,
                                             xnn_simd_f32_t b) {
  return Q6_Vsf_vmax_VsfVsf(a, b);
}

static XNN_INLINE xnn_simd_f32_t xnn_min_f32(xnn_simd_f32_t a,
                                             xnn_simd_f32_t b) {
  return Q6_Vsf_vmin_VsfVsf(a, b);
}

static XNN_INLINE xnn_simd_f32_t xnn_abs_f32(xnn_simd_f32_t a) {
  return Q6_Vsf_vabs_Vsf(a);
}

static XNN_INLINE xnn_simd_f32_t xnn_neg_f32(xnn_simd_f32_t a) {
  XNN_SIMD_CONST_F32(v0, 0);
  return Q6_Vsf_vsub_VsfVsf(v0, a);
}

// Logical operations.

static XNN_INLINE xnn_simd_f32_t xnn_and_f32(xnn_simd_f32_t a,
                                             xnn_simd_f32_t b) {
  return Q6_V_vand_VV(a, b);
}

static XNN_INLINE xnn_simd_f32_t xnn_or_f32(xnn_simd_f32_t a,
                                            xnn_simd_f32_t b) {
  return Q6_V_vor_VV(a, b);
}

static XNN_INLINE xnn_simd_f32_t xnn_xor_f32(xnn_simd_f32_t a,
                                             xnn_simd_f32_t b) {
  return Q6_V_vxor_VV(a, b);
}

// Load/store operations.

static XNN_INLINE xnn_simd_f32_t xnn_loadu_f32(const float* ptr) {
  return *((HVX_UVector*) ptr);
}

static XNN_INLINE xnn_simd_f32_t xnn_load_f32(const float* ptr) {
  return *((HVX_UVector*) ptr);
}

static XNN_INLINE void xnn_storeu_f32(float* ptr, xnn_simd_f32_t v) {
  *((HVX_UVector*) ptr) = v;
}

static XNN_INLINE void xnn_store_f32(float* ptr, xnn_simd_f32_t v) {
  *((HVX_UVector*) ptr) = v;
}

static XNN_INLINE xnn_simd_f32_t xnn_set1_f32(float v) {
  return Q6_V_vsplat_R(*(uint32_t *)&v);
}

static XNN_INLINE xnn_simd_f32_t xnn_set1_or_load_f32(const float* v) {
  return *((HVX_UVector*) v);
}

// Tail load/store operations.

static XNN_INLINE xnn_simd_f32_t
xnn_load_tail_f32(const float* input, size_t num_elements) XNN_OOB_READS {
  assert(num_elements > 0);
  assert(num_elements < xnn_simd_size_f32);

  return *((HVX_UVector*) input);
}

static XNN_INLINE void xnn_store_tail_f32(float* output, xnn_simd_f32_t v,
                                          size_t num_elements) {
  assert(num_elements > 0);
  assert(num_elements < xnn_simd_size_f32);

  return Q6_V_vstu_variable(output, num_elements << XNN_LOG2_SIZEOF_FLOAT, v);
}

#endif  // THIRD_PARTY_XNNPACK_INCLUDE_SIMD_F32_HVX_H_
