# Copyright (C) 2019 Intel Corporation.  All rights reserved.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
INCLUDE(CMakeForceCompiler)

SET(CMAKE_SYSTEM_NAME freebsd) # this one is important
SET(CMAKE_SYSTEM_VERSION 1) # this one not so much

message(STATUS "*** CHERI toolchain file ***")
set(CMAKE_VERBOSE_MAKEFILE ON)


if (NOT $ENV{CHERI_SDK_DIR} STREQUAL "")
  SET (toolchain_sdk_dir $ENV{CHERI_SDK_DIR}/)
endif ()

if (NOT $ENV{CHERI_SDKTARGETSYSROOT} STREQUAL "")
  SET(SDKTARGETSYSROOT $ENV{CHERI_SDKTARGETSYSROOT})
endif ()

message(STATUS "SDKTARGETSYSROOT=${SDKTARGETSYSROOT}")
message(STATUS "toolchain_sdk_dir=${toolchain_sdk_dir}")

# project should add_compile_options cflags of target, march, mabi, ... for asm file compile
# a compiler(and linker) wrapper for c,asm should be better
set(CMAKE_C_FLAGS "-target riscv64-unknown-freebsd -march=rv64gcxcheri -mabi=lp64d -mno-relax ${CMAKE_C_FLAGS} --sysroot=${SDKTARGETSYSROOT} -g -O2 -fuse-ld=lld -Wall -Wcheri")
set(CMAKE_CXX_FLAGS "-target riscv64-unknown-freebsd -march=rv64gcxcheri -mabi=lp64d -mno-relax ${CMAKE_CXX_FLAGS} --sysroot=${SDKTARGETSYSROOT}")

SET(CMAKE_C_COMPILER ${toolchain_sdk_dir}bin/clang)
SET(CMAKE_CXX_COMPILER ${toolchain_sdk_dir}bin/clang++)


# this is the file system root of the target
SET(CMAKE_FIND_ROOT_PATH ${SDKTARGETSYSROOT})

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
