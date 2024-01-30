# Build instruction

```bash
mkdir build

cd build

CHERI_SDK_DIR=$HOME/cheri/output/sdk \
  CHERI_SDKTARGETSYSROOT=$CHERI_SDK_DIR/sysroot-riscv64-hybrid \
  cmake .. \
  -DCMAKE_TOOLCHAIN_FILE=/home/chu/repos/wasm-micro-runtime/samples/simple/profiles/cheri-interp/toolchain.cmake \
  -DWAMR_BUILD_PLATFORM=cheribsd -DWAMR_BUILD_TARGET=RISCV64
```

Note: execute in bash script, the environment is not correctly set
