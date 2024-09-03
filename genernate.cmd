@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=5 -D NR=16 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=2 -o src/f32-gemm/gen/f32-gemm-5x16-minmax-fma3-u2-broadcast.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=5 -D NR=16 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=4 -o src/f32-gemm/gen/f32-gemm-5x16-minmax-fma3-u4-broadcast.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=5 -D NR=16 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=8 -o src/f32-gemm/gen/f32-gemm-5x16-minmax-fma3-u8-broadcast.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=5 -D NR=16 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=16 -o src/f32-gemm/gen/f32-gemm-5x16-minmax-fma3-u16-broadcast.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=5 -D NR=16 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=2 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-5x16-minmax-fma3-u2-broadcast-prfm.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=5 -D NR=16 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=4 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-5x16-minmax-fma3-u4-broadcast-prfm.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=5 -D NR=16 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=8 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-5x16-minmax-fma3-u8-broadcast-prfm.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=5 -D NR=16 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=16 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-5x16-minmax-fma3-u16-broadcast-prfm.c



@REM python tools/xngen.py src/f32-gemm/avx-broadcast.c.in -D MR=1 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -o src/f32-igemm/gen/f32-gemm-1x24-minmax-fma3-broadcast.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast.c.in -D MR=3 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -o src/f32-gemm/gen/f32-gemm-3x24-minmax-fma3-broadcast.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=3 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=2 -o src/f32-gemm/gen/f32-gemm-3x24-minmax-fma3-u2-broadcast.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=3 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=4 -o src/f32-gemm/gen/f32-gemm-3x24-minmax-fma3-u4-broadcast.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=3 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=8 -o src/f32-gemm/gen/f32-gemm-3x24-minmax-fma3-u8-broadcast.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=3 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=16 -o src/f32-gemm/gen/f32-gemm-3x24-minmax-fma3-u16-broadcast.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=3 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-3x24-minmax-fma3-broadcast-prfm.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=3 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=2 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-3x24-minmax-fma3-u2-broadcast-prfm.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=3 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=4 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-3x24-minmax-fma3-u4-broadcast-prfm.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=3 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=8 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-3x24-minmax-fma3-u8-broadcast-prfm.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=3 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=16 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-3x24-minmax-fma3-u16-broadcast-prfm.c


@REM python tools/xngen.py src/f32-gemm/avx-broadcast.c.in -D MR=4 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -o src/f32-gemm/gen/f32-gemm-4x24-minmax-fma3-broadcast.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=4 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=2 -o src/f32-gemm/gen/f32-gemm-4x24-minmax-fma3-u2-broadcast.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=4 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=4 -o src/f32-gemm/gen/f32-gemm-4x24-minmax-fma3-u4-broadcast.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=4 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=8 -o src/f32-gemm/gen/f32-gemm-4x24-minmax-fma3-u8-broadcast.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=4 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=16 -o src/f32-gemm/gen/f32-gemm-4x24-minmax-fma3-u16-broadcast.c

@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=4 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-4x24-minmax-fma3-broadcast-prfm.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=4 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=2 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-4x24-minmax-fma3-u2-broadcast-prfm.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=4 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=4 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-4x24-minmax-fma3-u4-broadcast-prfm.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=4 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=8 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-4x24-minmax-fma3-u8-broadcast-prfm.c
@REM python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=4 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=16 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-4x24-minmax-fma3-u16-broadcast-prfm.c


python tools/xngen.py src/qs8-gemm/MRx8c8-avxvnni-chenyu.c.in -D MR=5 -D DATATYPE=QC8     -D AVX=2 -D GFNI=0 -D PREFETCH=0 -D REQUANTIZATION=FP32 -o src/qs8-qc8w-gemm/gen/qs8-qc8w-gemm-5x8c8-minmax-fp32-avxvnni-k8.c
python tools/xngen.py src/qs8-gemm/MRx8c8-avxvnni-chenyu.c.in -D MR=5 -D DATATYPE=QC8     -D AVX=2 -D GFNI=0 -D PREFETCH=1 -D REQUANTIZATION=FP32 -o src/qs8-qc8w-gemm/gen/qs8-qc8w-gemm-5x8c8-minmax-fp32-avxvnni-k8-prfm.c

python tools/xngen.py src/qs8-gemm/MRx8c8-avxvnni-chenyu.c.in -D MR=5 -D DATATYPE=QC8     -D AVX=2 -D GFNI=0 -D PREFETCH=0 -D REQUANTIZATION=FP32 -D UNROLL=2 -o src/qs8-qc8w-gemm/gen/qs8-qc8w-gemm-5x8c8-minmax-fp32-avxvnni-k8-u2.c
python tools/xngen.py src/qs8-gemm/MRx8c8-avxvnni-chenyu.c.in -D MR=5 -D DATATYPE=QC8     -D AVX=2 -D GFNI=0 -D PREFETCH=0 -D REQUANTIZATION=FP32 -D UNROLL=4 -o src/qs8-qc8w-gemm/gen/qs8-qc8w-gemm-5x8c8-minmax-fp32-avxvnni-k8-u4.c
python tools/xngen.py src/qs8-gemm/MRx8c8-avxvnni-chenyu.c.in -D MR=5 -D DATATYPE=QC8     -D AVX=2 -D GFNI=0 -D PREFETCH=0 -D REQUANTIZATION=FP32 -D UNROLL=8 -o src/qs8-qc8w-gemm/gen/qs8-qc8w-gemm-5x8c8-minmax-fp32-avxvnni-k8-u8.c
python tools/xngen.py src/qs8-gemm/MRx8c8-avxvnni-chenyu.c.in -D MR=5 -D DATATYPE=QC8     -D AVX=2 -D GFNI=0 -D PREFETCH=1 -D REQUANTIZATION=FP32 -D UNROLL=2 -o src/qs8-qc8w-gemm/gen/qs8-qc8w-gemm-5x8c8-minmax-fp32-avxvnni-k8-u2-prfm.c
python tools/xngen.py src/qs8-gemm/MRx8c8-avxvnni-chenyu.c.in -D MR=5 -D DATATYPE=QC8     -D AVX=2 -D GFNI=0 -D PREFETCH=1 -D REQUANTIZATION=FP32 -D UNROLL=4 -o src/qs8-qc8w-gemm/gen/qs8-qc8w-gemm-5x8c8-minmax-fp32-avxvnni-k8-u4-prfm.c
python tools/xngen.py src/qs8-gemm/MRx8c8-avxvnni-chenyu.c.in -D MR=5 -D DATATYPE=QC8     -D AVX=2 -D GFNI=0 -D PREFETCH=1 -D REQUANTIZATION=FP32 -D UNROLL=8 -o src/qs8-qc8w-gemm/gen/qs8-qc8w-gemm-5x8c8-minmax-fp32-avxvnni-k8-u8-prfm.c
