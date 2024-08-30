python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=5 -D NR=16 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=2 -o src/f32-gemm/gen/f32-gemm-5x16-minmax-fma3-u2-broadcast.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=5 -D NR=16 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=4 -o src/f32-gemm/gen/f32-gemm-5x16-minmax-fma3-u4-broadcast.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=5 -D NR=16 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=8 -o src/f32-gemm/gen/f32-gemm-5x16-minmax-fma3-u8-broadcast.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=5 -D NR=16 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=16 -o src/f32-gemm/gen/f32-gemm-5x16-minmax-fma3-u16-broadcast.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=5 -D NR=16 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=2 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-5x16-minmax-fma3-u2-broadcast-prfm.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=5 -D NR=16 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=4 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-5x16-minmax-fma3-u4-broadcast-prfm.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=5 -D NR=16 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=8 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-5x16-minmax-fma3-u8-broadcast-prfm.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=5 -D NR=16 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=16 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-5x16-minmax-fma3-u16-broadcast-prfm.c



python tools/xngen.py src/f32-gemm/avx-broadcast.c.in -D MR=1 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -o src/f32-igemm/gen/f32-gemm-1x24-minmax-fma3-broadcast.c
python tools/xngen.py src/f32-gemm/avx-broadcast.c.in -D MR=3 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -o src/f32-gemm/gen/f32-gemm-3x24-minmax-fma3-broadcast.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=3 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=2 -o src/f32-gemm/gen/f32-gemm-3x24-minmax-fma3-u2-broadcast.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=3 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=4 -o src/f32-gemm/gen/f32-gemm-3x24-minmax-fma3-u4-broadcast.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=3 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=8 -o src/f32-gemm/gen/f32-gemm-3x24-minmax-fma3-u8-broadcast.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=3 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=16 -o src/f32-gemm/gen/f32-gemm-3x24-minmax-fma3-u16-broadcast.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=3 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-3x24-minmax-fma3-broadcast-prfm.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=3 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=2 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-3x24-minmax-fma3-u2-broadcast-prfm.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=3 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=4 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-3x24-minmax-fma3-u4-broadcast-prfm.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=3 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=8 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-3x24-minmax-fma3-u8-broadcast-prfm.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=3 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=16 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-3x24-minmax-fma3-u16-broadcast-prfm.c


python tools/xngen.py src/f32-gemm/avx-broadcast.c.in -D MR=4 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -o src/f32-gemm/gen/f32-gemm-4x24-minmax-fma3-broadcast.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=4 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=2 -o src/f32-gemm/gen/f32-gemm-4x24-minmax-fma3-u2-broadcast.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=4 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=4 -o src/f32-gemm/gen/f32-gemm-4x24-minmax-fma3-u4-broadcast.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=4 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=8 -o src/f32-gemm/gen/f32-gemm-4x24-minmax-fma3-u8-broadcast.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=4 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=16 -o src/f32-gemm/gen/f32-gemm-4x24-minmax-fma3-u16-broadcast.c

python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=4 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-4x24-minmax-fma3-broadcast-prfm.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=4 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=2 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-4x24-minmax-fma3-u2-broadcast-prfm.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=4 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=4 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-4x24-minmax-fma3-u4-broadcast-prfm.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=4 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=8 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-4x24-minmax-fma3-u8-broadcast-prfm.c
python tools/xngen.py src/f32-gemm/avx-broadcast-chenyu.c.in -D MR=4 -D NR=24 -D AVX=1 -D FMA=3 -D INC=0 -D DATATYPE=F32 -D UNROLL=16 -D PREFETCH=1 -o src/f32-gemm/gen/f32-gemm-4x24-minmax-fma3-u16-broadcast-prfm.c


