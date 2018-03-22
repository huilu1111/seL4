#
# Copyright 2019, Data61
# Commonwealth Scientific and Industrial Research Organisation (CSIRO)
# ABN 41 687 119 230.
#
# This software may be distributed and modified according to the terms of
# the GNU General Public License version 2. Note that NO WARRANTY is provided.
# See "LICENSE_GPLv2.txt" for details.
#
# @TAG(DATA61_GPL)
#

cmake_minimum_required(VERSION 3.7.2)


if(KernelPlatformImx8qm)
    set(KernelArmCortexA53 ON)
    set(KernelArchArmV8a ON)
    config_set(KernelPlatform PLAT "imx8qm")
    set(KernelArmMach "imx" CACHE INTERNAL "")
    if(KernelSel4ArchAarch64)
        set(KernelHaveFPU ON)
    endif()
    set(KernelArmPASizeBits40 ON)
    list(APPEND KernelDTSList "tools/dts/imx8QM.dts")
    list(APPEND KernelDTSList "src/plat/imx8qm/overlay-imx8QM.dts")
endif()

add_sources(
    DEP "KernelPlatformImx8qm"
    CFILES
        src/arch/arm/machine/gic_v3.c
        src/arch/arm/machine/l2c_nop.c
)
