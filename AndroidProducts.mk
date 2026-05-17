#
# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/pixelos_samurai.mk

COMMON_LUNCH_CHOICES := \
    pixelos_samurai-userdebug

# --- Conceptual content for device/samurai/samurai/pixelos_samurai.mk ---
$(call inherit-product, vendor/pixelos/config/common.mk)
$(call inherit-product, $(LOCAL_DIR)/device.mk)

PRODUCT_DEVICE_MAINTAINERS := samurai-minhaz

$(call inherit-product, $(LOCAL_DIR)/pixel_props.mk)

PRODUCT_SHIPPING_API_LEVEL := 35

PRODUCT_FULL_TREBLE_OVERRIDE := true

PRODUCT_PACKAGES += \
    -Camera2

PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.set_idle_timer_ms=4000 \
    ro.surface_flinger.set_touch_timer_ms=200 \
    ro.vendor.perf.scroll_opt=1 \
    windowsmgr.max_events_per_sec=150 \
    persist.vendor.camera.HAL3.enabled=1 \
    persist.vendor.camera.eis.enable=1 \
    persist.vendor.audio.hifi=true \
    ro.vendor.audio.sdk.fluencetype=none

# --- Conceptual content for device/samurai/samurai/BoardConfig.mk ---
TARGET_USES_VULKAN := true
TARGET_USES_ION := true

BOARD_AVB_ENABLE := false
BOARD_AVB_MAKE_VBMETA_IMAGE := false

TARGET_LTO_UNSAFE := full

BOARD_USES_AB_UPDATER := false

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_TAGS_OFFSET := 0x00000100
BOARD_DTB_OFFSET := 0x01000000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_BOOT_HEADER_VERSION := 4

BOARD_USES_FILE_BASED_ENCRYPTION := true
TARGET_HW_DISK_ENCRYPTION := true
TWRP_INCLUDE_IN_MANIFEST := true

# --- Conceptual content for device/samurai/samurai/pixel_props.mk ---
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.brand=google \
    ro.product.manufacturer=Google \
    ro.product.model=Pixel 6 \
    ro.product.device=raven \
    ro.build.fingerprint=google/raven/raven:16/AP1A.240105.001/1234567:user/release-keys \
    ro.boot.verifiedbootstate=green \
    ro.boot.flash.locked=1 \
    ro.boot.vbmeta.device_state=locked

# --- Conceptual content for kernel/samurai/samurai/arch/arm64/configs/samurai_defconfig ---
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_ZRAM=y
CONFIG_LZ4_COMPRESSION=y
CONFIG_HZ_PERIODIC=y
CONFIG_NO_HZ_FULL=y
CONFIG_RCU_NOCB_CPU=y
CONFIG_SCHED_AUTOGROUP=y
CONFIG_SCHED_CORE=y
CONFIG_KPTI=y
CONFIG_ARM64_SW_TTBR0_PAN=y
CONFIG_RANDOMIZE_BASE=y
CONFIG_DEBUG_RODATA=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_VIDEO_V4L2=y
CONFIG_IIO=y