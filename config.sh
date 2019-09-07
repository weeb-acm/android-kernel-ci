#!/bin/bash

export REPO_ROOT=`pwd`

# Paths
export CROSS_COMPILE="${REPO_ROOT}/data/gcc/bin/aarch64-elf-"
export CROSS_COMPILE_ARM32="${REPO_ROOT}/data/gcc32/bin/arm-eabi-"
export ANYKERNEL_DIR="${REPO_ROOT}/data/anykernel"
export ANYKERNEL_IMAGE_DIR="${ANYKERNEL_DIR}"
export KERNEL_DIR="${REPO_ROOT}/data/kernel"

# Define to enable ccache
if [ ! -z ${AKCI_CCACHE} ]; then
    export CLANG="ccache ${CLANG}"
    mkdir -p "ccache"
    export CCACHE_BASEDIR="${REPO_ROOT}"
    export CCACHE_DIR="${REPO_ROOT}/ccache"
    export CCACHE_COMPILERCHECK="content"
fi

# If not defined gives long compiler name
export COMPILER_NAME="GCC Custom"

# Kernel config
export DEFCONFIG="weebomni_defconfig"
export KERNEL_NAME="Weeb-Kernel-ACM"

export KBUILD_BUILD_USER="elf"
export KBUILD_BUILD_HOST="buildstation"
export KBUILD_BUILD_VERSION=1
