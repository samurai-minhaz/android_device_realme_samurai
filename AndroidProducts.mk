# Copyright (C) 2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/pixelos_samurai.mk

COMMON_LUNCH_CHOICES := \
    pixelos_samurai-userdebug

# device/samurai/samurai/pixelos_samurai.mk
WITH_GMS := true
TARGET_GAPPS_ARCH := arm64
$(call inherit-product, vendor/pixelos/config/common_full_phone.mk)
$(call inherit-product, $(LOCAL_DIR)/device.mk)

PRODUCT_NAME := pixelos_samurai
PRODUCT_DEVICE := samurai
PRODUCT_MANUFACTURER := samurai
PRODUCT_BRAND := Google
PRODUCT_MODEL := Pixel 9 Pro
PRODUCT_GMS_CLIENTID_BASE := android-google

PRODUCT_BUILD_PROP_FLAGS += ro.rom.maintainer=Samurai-Minhaz
PRODUCT_SHIPPING_API_LEVEL := 35
PRODUCT_FULL_TREBLE_OVERRIDE := true

$(call inherit-product, $(LOCAL_DIR)/pixel_props.mk)

PRODUCT_PACKAGES += \
    -Camera2 \
    android.hardware.biometrics.fingerprint-service.samurai \
    android.hardware.lights-service.samurai \
    android.hardware.powershare-service.samurai \
    android.hardware.health-service.samurai

PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.set_idle_timer_ms=4000 \
    ro.surface_flinger.set_touch_timer_ms=200 \
    ro.vendor.perf.scroll_opt=1 \
    windowsmgr.max_events_per_sec=150 \
    persist.vendor.camera.HAL3.enabled=1 \
    persist.vendor.camera.eis.enable=1 \
    persist.vendor.camera.privapp.list=com.google.android.GoogleCamera,com.google.android.GoogleCamera.BSG,com.google.android.GoogleCamera.LMC \
    persist.vendor.audio.hifi=true \
    ro.vendor.audio.sdk.fluencetype=none \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    ro.surface_flinger.has_wide_color_display=true \
    ro.surface_flinger.use_color_management=true

# device/samurai/samurai/BoardConfig.mk
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_USES_VULKAN := true
TARGET_USES_ION := true

BOARD_AVB_ENABLE := false
BOARD_AVB_MAKE_VBMETA_IMAGE := false

BOARD_USE_DYNAMIC_PARTITIONS := false
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4294967296
BOARD_VENDORIMAGE_PARTITION_SIZE := 805306368
BOARD_PRODUCTIMAGE_PARTITION_SIZE := 1073741824
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := erofs
BOARD_EROFS_COMPRESSOR := lz4hc
BOARD_EROFS_PCLUSTER_SIZE := 4096

BOARD_USES_THINLTO := true
BOARD_USES_AB_UPDATER := false

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_TAGS_OFFSET := 0x00000100
BOARD_DTB_OFFSET := 0x01000000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

BOARD_KERNEL_CMDLINE := androidboot.hardware=samurai androidboot.boot_devices=soc/1d84000.ufshc loop.max_part=7 androidboot.force_normal_boot=1

BOARD_USES_FILE_BASED_ENCRYPTION := true
BOARD_USES_METADATA_PARTITION := true
TARGET_HW_DISK_ENCRYPTION := true
TWRP_INCLUDE_IN_MANIFEST := true

PLATFORM_SECURITY_PATCH := 2025-01-05
VENDOR_SECURITY_PATCH := 2025-01-05

# device/samurai/samurai/pixel_props.mk
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.brand=google \
    ro.product.manufacturer=Google \
    ro.product.model=Pixel 9 Pro \
    ro.product.device=caiman \
    ro.build.fingerprint=google/caiman/caiman:16/BP1A.250105.002/1234567:user/release-keys \
    ro.boot.verifiedbootstate=green \
    ro.boot.flash.locked=1 \
    ro.boot.vbmeta.device_state=locked \
    persist.sys.pixel.camera.features=true \
    persist.sys.pixel_storage_unlimited=true \
    ro.storage_manager.enabled=true \
    ro.com.google.clientidbase=android-google \
    ro.crypto.volume.filenames_mode=aes-256-cts \
    ro.crypto.allow_encrypt_override=true

# kernel/samurai/samurai/arch/arm64/configs/samurai_defconfig
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_ZRAM=y
CONFIG_LZ4_COMPRESSION=y
CONFIG_ZRAM_DEF_COMP_LZ4=y
CONFIG_LRU_GEN=y
CONFIG_LRU_GEN_ENABLED=y
CONFIG_EROFS_FS=y
CONFIG_EROFS_FS_ZIP=y
CONFIG_EROFS_FS_ZIP_LZ4=y
CONFIG_F2FS_FS=y
CONFIG_F2FS_FS_COMPRESSION=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y
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