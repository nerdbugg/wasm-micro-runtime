# Copyright (C) 2019 Intel Corporation.  All rights reserved.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
INCLUDE(CMakeForceCompiler)

SET(CMAKE_SYSTEM_NAME Linux) # this one is important
SET(CMAKE_SYSTEM_VERSION 1) # this one not so much

message(STATUS "*** riscv64 toolchain file ***")
set(CMAKE_VERBOSE_MAKEFILE ON)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D_GNU_SOURCE")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D_GNU_SOURCE")

SET(CMAKE_C_COMPILER riscv64-linux-gnu-gcc)
SET(CMAKE_CXX_COMPILER riscv64-linux-gnu-g++)

