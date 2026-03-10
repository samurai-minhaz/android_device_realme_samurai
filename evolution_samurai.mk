#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# --- 1. BASE INHERITANCE ---
$(call inherit-product, device/realme/samurai/device.mk)
$(call inherit-product, vendor/evolution/config/common_full_phone.mk)

# --- 2. EXTREME PERFORMANCE & KERNEL TUNING ---
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=16m \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=2m \
    dalvik.vm.heapmaxfree=8m \
    ro.vendor.qti.am.resourcemanager.enable=true \
    persist.vendor.qti.games.gt.enable=true \
    ro.sys.fw.bg_apps_limit=60 \
    ro.config.fha_enable=true \
    persist.sys.binary_xml=true \
    debug.performance.tuning=1 \
    debug.cpurender.force=1 \
    ro.vendor.perf.scroll_opt=true \
    persist.sys.io.scheduler=cfq

# --- 3. 90Hz DISPLAY & TOUCH MONSTER (Zero Latency) ---
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.ui.hw=1 \
    view.scroll_friction=0.013 \
    ro.config.smooth_scroll=1 \
    debug.sf.disable_backpressure=1 \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    ro.surface_flinger.has_wide_color_display=true \
    ro.surface_flinger.has_HDR_display=true \
    ro.surface_flinger.set_touch_timer_ms=200 \
    ro.surface_flinger.set_display_menu_timer_ms=1500 \
    ro.surface_flinger.use_smart_90_for_video=true \
    ro.surface_flinger.force_hwc_copyback_cache=1 \
    touch.device.resample=1 \
    persist.sys.scrolling_cache=2

# --- 4. AUDIO, NETWORK & BATTERY ---
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.vc_call_vol_steps=14 \
    ro.config.media_vol_steps=25 \
    persist.vendor.audio.hw.binder.size_kbyte=1024 \
    wifi.supplicant_scan_interval=180 \
    ro.ril.power_collapse=1 \
    pm.sleep_mode=1 \
    ro.config.hw_quickpoweron=true \
    persist.sys.use_dithering=1

# --- 5. EVOLUTION X & PIXEL EXCLUSIVE PRO FEATURES ---
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_GAPPS_ARCH := arm64
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SCREEN_DENSITY := 480
TARGET_SUPPORTS_NEXT_GEN_ASSISTANT := true
TARGET_INCLUDE_STOCK_ARCORE := true
TARGET_INCLUDE_LIVE_WALLPAPERS := true
TARGET_SUPPORTS_GOOGLE_RECORDER := true
TARGET_SUPPORTS_CALL_RECORDING := true
EVO_BUILD_TYPE := OFFICIAL

# --- 6. DYNAMIC PARTITION DISABLE (For Recovery Compatibility) ---
# এখানে আমরা কোনো ডাইনামিক ফ্ল্যাগ রাখিনি যাতে রিকভারিতে এরর না আসে।
# তোমার samurai ডিভাইসের রেগুলার পার্টিশন লেআউটই এটি ব্যবহার করবে।

# --- 7. DEVICE IDENTITY & SAFETYNET ---
PRODUCT_BRAND := realme
PRODUCT_DEVICE := samurai
PRODUCT_MANUFACTURER := realme
PRODUCT_MODEL := realme X2 Pro
PRODUCT_NAME := evolution_samurai

BUILD_FINGERPRINT := realme/RMX1931/RMX1931L1:11/RKQ1.200928.002/1625457120608:user/release-keys
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="RMX1931-user 11 RKQ1.200928.002 1625457120608 release-keys" \
    PRODUCT_MODEL="RMX1931" \
    PRODUCT_NAME="RMX1931"
PRODUCT_GMS_CLIENTID_BASE := android-oppo

# --- 8. MAINTAINER INFO ---
PRODUCT_MAINTAINER := Mohammad Minhaz
