# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/common/gps/gps_as_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/zte/Tn960/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := zte_Tn960
PRODUCT_DEVICE := Tn960
PRODUCT_MODEL := ZTE Tn960
PRODUCT_LOCALES := zh_CN zh_TW en_US

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    Gallery3d \
    SpareParts \
    Development \
    Term \
    libOmxCore \
    copybit.Tn960 \
    gralloc.Tn960 \
    lights.Tn960 \
    libOmxVidEnc \
    FM \
    abtfilt \
    dexpreopt

# proprietary side of the device
$(call inherit-product-if-exists, vendor/zte/Tn960/Tn960-vendor.mk)

DISABLE_DEXPREOPT := false

# Apk
PRODUCT_COPY_FILES += \
    packages/apps/RootExplorer.apk:system/app/RootExplorer.apk

# 3G
PRODUCT_COPY_FILES += \
    device/zte/Tn960/prebuilt/system/etc/apns-conf.xml:system/etc/apns-conf.xml

# PhoneLocation
PRODUCT_COPY_FILES += \
    device/zte/Tn960/prebuilt/system/lib/libphoneloc-jni.so:system/lib/libphoneloc-jni.so \
    device/zte/Tn960/prebuilt/data/system/phoneloc.dat:/data/system/phoneloc.dat \
    device/zte/Tn960/prebuilt/system/usr/share/phoneloc.dat:system/usr/share/phoneloc.dat

# FTM
PRODUCT_COPY_FILES += \
    device/zte/Tn960/prebuilt/sbin/check_ftm.sh:root/sbin/check_ftm.sh \
    device/zte/Tn960/prebuilt/sbin/diagftmtest:root/sbin/diagftmtest \
    device/zte/Tn960/prebuilt/sbin/ftm:root/sbin/ftm 

# Lib
PRODUCT_COPY_FILES += \
    device/zte/Tn960/prebuilt/system/lib/libreference-cdma-sms.so:system/lib/libreference-cdma-sms.so \
    device/zte/Tn960/prebuilt/system/lib/libreference-ril.so:system/lib/libreference-ril.so \
    device/zte/Tn960/prebuilt/system/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
    device/zte/Tn960/prebuilt/system/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    device/zte/Tn960/prebuilt/system/lib/libSimCardAuth.so:system/lib/libSimCardAuth.so

# Usr
PRODUCT_COPY_FILES += \
    device/zte/Tn960/prebuilt/system/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/zte/Tn960/prebuilt/system/usr/keylayout/Tn960_keypad.kl:system/usr/keylayout/Tn960_keypad.kl \
    device/zte/Tn960/prebuilt/system/usr/keychars/Tn960_keypad.kcm.bin:system/usr/keychars/Tn960_keypad.kcm.bin

# Vold
PRODUCT_COPY_FILES += \
    device/zte/Tn960/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab

# Init
PRODUCT_COPY_FILES += \
    device/zte/Tn960/prebuilt/init.Tn960.rc:root/init.Tn960.rc \
    device/zte/Tn960/prebuilt/ueventd.Tn960.rc:root/ueventd.Tn960.rc \
    device/zte/Tn960/prebuilt/sbin/usbconfig:root/sbin/usbconfig

# Audio
PRODUCT_COPY_FILES += \
    device/zte/Tn960/prebuilt/system/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/zte/Tn960/prebuilt/system/etc/AudioFilter.csv:system/etc/AudioFilter.csv

# WLAN + BT + FM
PRODUCT_COPY_FILES += \
    device/zte/Tn960/prebuilt/system/etc/init.bt.sh:system/etc/init.bt.sh \
    device/zte/Tn960/prebuilt/system/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    device/zte/Tn960/prebuilt/system/etc/init.wlanprop.sh:system/etc/init.wlanprop.sh \
    device/zte/Tn960/prebuilt/system/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/zte/Tn960/prebuilt/system/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# Kernel Modules
PRODUCT_COPY_FILES += \
    device/zte/Tn960/prebuilt/system/lib/modules/dhd.ko:system/lib/modules/dhd.ko \
    device/zte/Tn960/prebuilt/system/lib/modules/2.6.35.7-pref+/zram.ko:system/lib/modules/2.6.35.7-pref+/zram.ko 

# WiFi firmware
PRODUCT_COPY_FILES += \
    device/zte/Tn960/prebuilt/system/etc/fw_4319.bin:system/etc/fw_4319.bin \
    device/zte/Tn960/prebuilt/system/etc/fw_4319_apsta.bin:system/etc/fw_4319_apsta.bin \
    device/zte/Tn960/prebuilt/system/etc/nv_4319.txt:system/etc/nv_4319.txt \
    device/zte/Tn960/prebuilt/system/etc/fw_4329.bin:system/etc/fw_4329.bin \
    device/zte/Tn960/prebuilt/system/etc/fw_4329_apsta.bin:system/etc/fw_4329_apsta.bin \
    device/zte/Tn960/prebuilt/system/etc/nv_4329.txt:system/etc/nv_4329.txt

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.media.dec.jpeg.memcap=10000000

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.baseband_version=P743B01 \
    wifi.supplicant_scan_interval=60 \
    ro.com.android.dataroaming=false

# Tn960 uses high-density artwork where available
PRODUCT_LOCALES += hdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# This should not be needed but on-screen keyboard uses the wrong density without it.
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.sf.lcd_density=240 

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=10 \
persist.sys.language=zh \
    persist.sys.country=CN \
    persist.sys.timezone=Asia/Shanghai \
    ro.cdma.home.operator.numeric=46003 \
    ro.telephony.default_network=4 \
ro.cdma.home.operator.alpha=中国电信 \
    ro.config.cdma_subscription=0 \
    ril.subscription.types=RUIM,NV \
    ro.telephony.call_ring.multiple=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072

