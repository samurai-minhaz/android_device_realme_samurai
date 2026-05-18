#
# Copyright (C) 2020-2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

TARGET_DEVICE := samurai
LOCAL_PATH := device/realme/samurai

# --- [STAGE 1] CORE INHERITANCE ---
$(call inherit-product, hardware/qcom-caf/common/common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# --- [STAGE 2] PERFORMANCE & OPTIMIZATION FLAGS ---
TARGET_USES_VULKAN := true
TARGET_USES_ION := true
BOARD_AVB_ENABLE := false
PRODUCT_BUILD_PROP_FLAGS += ro.rom.maintainer=Samurai-Minhaz

# --- [STAGE 3] PERFORMANCE MEMORY TUNING ---
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Vendor connection
$(call inherit-product, vendor/realme/samurai/samurai-vendor.mk)

# Display & Animation
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage
PRODUCT_ENFORCE_RRO_TARGETS := *

# --- [STAGE 4] PRODUCT PACKAGES ---
PRODUCT_PACKAGES += \
    CarrierConfigRes \
    FrameworksResSamurai \
    RealmeParts \
    HotwordEnrollmentOKGoogleHEXGON \
    HotwordEnrollmentX EnrollmentOKGoogleHEXGON \
    libvolumelistener \
    libshim_vtservice \
    libshim_gputils

# --- [STAGE 5] HARDWARE PERMISSIONS (Graphics/Vulkan) ---
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml

# --- [STAGE 6] HARDWARE PERMISSIONS (Camera/Biometrics) ---
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# --- [STAGE 7] FIRMWARE SYMLINKS ---
PRODUCT_PACKAGES += \
    firmware_wlan_mac.bin_symlink \
    firmware_WCNSS_qcom_cfg.ini_symlink \
    firmware_bt_fw.b01_symlink \
    firmware_bt_fw.b02_symlink \
    firmware_bt_fw.b03_symlink \
    firmware_bt_fw.mdt_symlink

# --- [STAGE 8] MEDIA & AUDIO ---
PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    audio.primary.msmnile \
    audio.bluetooth.default \
    audio.usb.default \
    libtinycompress \
    android.hardware.media.c2@1.0.vendor \
    libOmxVdec \
    libOmxVenc \
    libOmxCore

# --- [STAGE 9] CONNECTIVITY ---
PRODUCT_PACKAGES += \
    wpa_supplicant \
    hostapd \
    com.android.nfc_extras \
    Tag \
    NfcNci \
    android.hardware.nfc@1.2-service

# --- [STAGE 10] GRAPHICS ENGINE ---
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.4-service \
    android.hardware.graphics.mapper@4.0-impl-qti-display \
    libvulkan \
    gralloc.msmnile \
    hwcomposer.msmnile \
    libdisplayconfig.qti

# --- [STAGE 11] SYSTEM SERVICES (Android 16 AIDL Transition) ---
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint-service.samurai \
    vendor.goodix.hardware.biometrics.fingerprint@2.1 \
    android.hardware.powershare@1.0-service.samurai \
    android.hardware.usb@1.0-service

# --- [STAGE 12] ULTIMATE PROPERTIES ---
PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.set_idle_timer_ms=4000 \
    ro.surface_flinger.set_touch_timer_ms=200 \
    ro.surface_flinger.use_smart_90_for_video=true \
    ro.vendor.perf.scroll_opt=1 \
    windowsmgr.max_events_per_sec=150 \
    ro.max.fling_velocity=12000 \
    persist.vendor.camera.HAL3.enabled=1 \
    persist.vendor.camera.eis.enable=1 \
    persist.sys.camera.camera2=true \
    persist.vendor.camera.privapp.list=com.google.android.GoogleCamera,com.google.android.GoogleCamera.BSG,com.google.android.GoogleCamera.LMC \
    vendor.camera.aux.packagelist=com.google.android.GoogleCamera,org.codeaurora.snapcam \
    persist.vendor.audio.hifi=true \
    ro.vendor.audio.sdk.fluencetype=none \
    ro.hardware.egl=adreno \
    ro.hardware.vulkan=adreno

# Play Integrity & Device Spoofing (Pixel 9 Pro XL)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.model=Pixel 9 Pro XL \
    ro.product.brand=google \
    ro.product.manufacturer=Google \
    ro.build.fingerprint=google/komodo/komodo:15/AP3A.241005.015/12491514:user/release-keys

# Power & Speed
PRODUCT_DEXPREOPT_SPEED_APPS += SystemUI Launcher3QuickStep
$(call inherit-product, packages/apps/RealmeParts/parts.mk)