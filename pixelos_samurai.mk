#
# Copyright (C) 2020-2026 The PixelOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# --- 1. BASE INHERITANCE ---
# Inherit from device-specific configuration first
$(call inherit-product, device/realme/samurai/device.mk)

# Enable GApps and inherit from PixelOS common configuration
WITH_GMS := true
TARGET_GAPPS_ARCH := arm64
$(call inherit-product, vendor/pixelos/config/common_full_phone.mk)

# --- 2. DEVICE IDENTITY & MAINTAINER ---
PRODUCT_BRAND := Google
PRODUCT_DEVICE := samurai
PRODUCT_MANUFACTURER := realme
PRODUCT_MODEL := Pixel 9 Pro
PRODUCT_NAME := pixelos_samurai

# Maintainer Signature & Build Properties
PRODUCT_BUILD_PROP_FLAGS += ro.rom.maintainer=Samurai-Minhaz

# Play Integrity & Device Spoofing (Android 16 Baklava)
BUILD_FINGERPRINT := google/caiman/caiman:16/BP1A.250105.002/1234567:user/release-keys
PRODUCT_GMS_CLIENTID_BASE := android-google

# --- 3. CORE OPTIMIZATION FLAGS ---
TARGET_USES_VULKAN := true
TARGET_USES_ION := true
BOARD_AVB_ENABLE := false
BOARD_USES_THINLTO := true

# --- 4. PERFORMANCE & DALVIK VM TUNING ---
# Optimized for 8GB/12GB RAM (Realme X2 Pro standard)
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.am.resourcemanager.enable=true \
    ro.sys.fw.bg_apps_limit=60 \
    persist.sys.binary_xml=true \
    ro.vendor.perf.scroll_opt=1 \
    windowsmgr.max_events_per_sec=150 \
    persist.sys.io.scheduler=mq-deadline \
    dalvik.vm.dex2oat64-threads=8

# --- 5. 90Hz DISPLAY & TOUCH OPTIMIZATION ---
# Specifically tuned for the samurai's 90Hz panel for zero-jitter
PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.set_idle_timer_ms=4000 \
    ro.surface_flinger.set_touch_timer_ms=200 \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    ro.surface_flinger.has_wide_color_display=true \
    ro.surface_flinger.has_HDR_display=true \
    ro.surface_flinger.use_color_management=true \
    persist.sys.sf.native_mode=2 \
    debug.sf.disable_backpressure=1 \
    touch.device.resample=1 \
    view.scroll_friction=0.013

# --- 6. CAMERA HAL3 & ADVANCED GCAM SUPPORT ---
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.camera.HAL3.enabled=1 \
    persist.vendor.camera.eis.enable=1 \
    persist.vendor.camera.privapp.list=com.google.android.GoogleCamera,com.google.android.GoogleCamera.BSG,com.google.android.GoogleCamera.LMC \
    persist.sys.pixel.camera.features=true

# --- 7. PREMIUM AUDIO STACK ---
# Lossless rendering for JamesDSP, ViPER4Android, and Dolby Atmos
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.audio.hifi=true \
    ro.vendor.audio.sdk.fluencetype=none \
    ro.config.vc_call_vol_steps=14 \
    ro.config.media_vol_steps=25 \
    persist.vendor.audio.hw.binder.size_kbyte=1024

# --- 8. NETWORK & CONNECTIVITY ---
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=180 \
    ro.com.google.clientidbase=android-google

# --- 9. PIXEL EXCLUSIVE FEATURES (A16 Compatibility) ---
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_SCREEN_DENSITY := 480

# Pixel Exclusive Flags & AI Suite
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.pixel_storage_unlimited=true \
    ro.storage_manager.enabled=true \
    ro.com.google.gms.google_one_eligible=true

TARGET_SUPPORTS_QUICK_TAP := true 
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_NEXT_GEN_ASSISTANT := true
TARGET_INCLUDE_STOCK_ARCORE := true
TARGET_INCLUDE_LIVE_WALLPAPERS := true
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_SUPPORTS_CALL_RECORDING := true