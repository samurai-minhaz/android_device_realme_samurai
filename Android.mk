#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifneq ($(filter samurai,$(TARGET_DEVICE)),)

# Inherit from the Pixel props for a premium experience
# This file will be created in device/samurai/samurai/pixel_props.mk
$(call inherit-product, device/samurai/samurai/pixel_props.mk)

# Device Maintainer
PRODUCT_DEVICE_MAINTAINERS := samurai-minhaz

# Treble Compliance
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_SHIPPING_API_LEVEL := 34 # Assuming Android 16 API Level is 34
PRODUCT_TARGET_VNDK_VERSION := current

# Performance Flags
TARGET_USES_VULKAN := true
TARGET_USES_ION := true
TARGET_LTO_UNSAFE := full

# AVB Configuration (as per strict instruction)
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE := true

# A/B Updater (Disabled due to recovery not supporting dynamic partitions)
BOARD_USES_AB_UPDATER := false
# Dynamic partition related flags are omitted as recovery doesn't support them.
# BOARD_SUPER_PARTITION_SIZE := ...
# BOARD_SUPER_PARTITION_GROUPS := ...
# BOARD_SUPER_PARTITION_BLOCKS := ...

# System Properties for Optimization and Features
PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.set_idle_timer_ms=4000 \
    ro.surface_flinger.set_touch_timer_ms=200 \
    ro.vendor.perf.scroll_opt=1 \
    windowsmgr.max_events_per_sec=150 \
    persist.vendor.camera.HAL3.enabled=1 \
    persist.vendor.camera.eis.enable=1 \
    persist.vendor.camera.privapp.list=com.google.android.GoogleCamera,com.google.android.GoogleCamera.BSG,com.google.android.GoogleCamera.LMC \
    persist.vendor.audio.hifi=true \
    ro.vendor.audio.sdk.fluencetype=none

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

# A/B builds require us to create the mount points at compile time.
# Just creating it for all cases since it does not hurt.
FIRMWARE_MOUNT_POINT := $(TARGET_OUT_VENDOR)/firmware_mnt
$(FIRMWARE_MOUNT_POINT): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating $(FIRMWARE_MOUNT_POINT)"
	@mkdir -p $(TARGET_OUT_VENDOR)/firmware_mnt

BT_FIRMWARE_MOUNT_POINT := $(TARGET_OUT_VENDOR)/bt_firmware
$(BT_FIRMWARE_MOUNT_POINT): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating $(BT_FIRMWARE_MOUNT_POINT)"
	@mkdir -p $(TARGET_OUT_VENDOR)/bt_firmware

DSP_MOUNT_POINT := $(TARGET_OUT_VENDOR)/dsp
$(DSP_MOUNT_POINT): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating $(DSP_MOUNT_POINT)"
	@mkdir -p $(TARGET_OUT_VENDOR)/dsp

ALL_DEFAULT_INSTALLED_MODULES += $(FIRMWARE_MOUNT_POINT) $(BT_FIRMWARE_MOUNT_POINT) $(DSP_MOUNT_POINT)

endif