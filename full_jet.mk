# Inherit AOSP device configuration for passion.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/jetdroid/prelink-linux-arm-jet.map

DEVICE_PACKAGE_OVERLAYS += device/samsung/jet/overlay

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240

# Repeat ring tone on incoming calls
PRODUCT_PROPERTY_OVERRIDES += \
ro.telephony.call_ring.multiple=false

#
# GPS config & application from sucka
#
PRODUCT_COPY_FILES += \
    device/samsung/jet/prebuilt/jet/gps/gps.conf:system/etc/gps.conf \
    device/samsung/jet/prebuilt/jet/gps/LBSModeApp.apk:system/app/LBSModeApp.apk

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
#    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml 

# media config xml file
PRODUCT_COPY_FILES += \
    device/samsung/jet/media_profiles.xml:system/etc/media_profiles.xml

#
# Copy jet specific prebuilt files
#

#
# Wifi
#
PRODUCT_COPY_FILES += \
    device/samsung/jet/prebuilt/jet/wifi/libwlmlogger.so:system/lib/libwlmlogger.so \
    device/samsung/jet/prebuilt/jet/wifi/libwlservice.so:system/lib/libwlservice.so \
    device/samsung/jet/prebuilt/jet/wifi/nvram.txt:system/etc/nvram.txt \
    device/samsung/jet/prebuilt/jet/wifi/rtecdc.bin:system/etc/rtecdc.bin \
    device/samsung/jet/prebuilt/jet/wifi/rtecdc_apsta.bin:system/etc/rtecdc_apsta.bin \
    device/samsung/jet/prebuilt/jet/wifi/nvram_mfg.txt:system/etc/nvram_mfg.txt \
    device/samsung/jet/prebuilt/jet/wifi/rtecdc_mfg.bin:system/etc/rtecdc_mfg.bin \
    device/samsung/jet/prebuilt/jet/wifi/bcm_supp.conf:system/etc/bcm_supp.conf \
    device/samsung/jet/prebuilt/jet/wifi/wifi.conf:system/etc/wifi.conf \
    device/samsung/jet/prebuilt/jet/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/jet/prebuilt/jet/wifi/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/jet/prebuilt/jet/wifi/wlservice:system/bin/wlservice

#
# Display (2D)
#
PRODUCT_COPY_FILES += \
    device/samsung/jet/prebuilt/jet/gralloc-libs/libs3c2drender.so:system/lib/libs3c2drender.so \
    device/samsung/jet/prebuilt/jet/gralloc-libs/libsavscmn.so:system/lib/libsavscmn.so \
    device/samsung/jet/prebuilt/jet/gralloc-libs/hw/gralloc.GT-S8000.so:system/lib/hw/gralloc.GT-S8000.so

#
# Display (3D)
#
PRODUCT_COPY_FILES += \
    device/samsung/jet/prebuilt/jet/fimg-libs/egl.cfg:system/lib/egl/egl.cfg \

#
# 3D GFX
#
ifdef JETDROID_WITH_3D
PRODUCT_COPY_FILES += \
    device/samsung/jet/prebuilt/jet/3dpack/libopencore_download.so:system/lib/libopencore_download.so \
    device/samsung/jet/prebuilt/jet/3dpack/libopencore_downloadreg.so:system/lib/libopencore_downloadreg.so \
    device/samsung/jet/prebuilt/jet/3dpack/libopencore_mp4local.so:system/lib/libopencore_mp4local.so \
    device/samsung/jet/prebuilt/jet/3dpack/libopencore_mp4localreg.so:system/lib/libopencore_mp4localreg.so \
    device/samsung/jet/prebuilt/jet/3dpack/libopencore_player.so:system/lib/libopencore_player.so \
    device/samsung/jet/prebuilt/jet/3dpack/libopencore_rtsp.so:system/lib/libopencore_rtsp.so \
    device/samsung/jet/prebuilt/jet/3dpack/libopencore_rtspreg.so:system/lib/libopencore_rtspreg.so \
    device/samsung/jet/prebuilt/jet/3dpack/libskia.so:system/lib/libskia.so \
    device/samsung/jet/prebuilt/jet/3dpack/libskiagl.so:system/lib/libskiagl.so \
    device/samsung/jet/prebuilt/jet/3dpack/libstagefright_color_conversion.so:system/lib/libstagefright_color_conversion.so \
    device/samsung/jet/prebuilt/jet/3dpack/libsurfaceflinger.so:system/lib/libsurfaceflinger.so \
    device/samsung/jet/prebuilt/jet/3dpack/libsurfaceflinger_client.so:system/lib/libsurfaceflinger_client.so \
    device/samsung/jet/prebuilt/jet/3dpack/egl/libChunkAlloc.so:system/lib/egl/libChunkAlloc.so \
    device/samsung/jet/prebuilt/jet/3dpack/egl/libEGL_fimg.so:system/lib/egl/libEGL_fimg.so \
    device/samsung/jet/prebuilt/jet/3dpack/egl/libGLESv1_CM_fimg.so:system/lib/egl/libGLESv1_CM_fimg.so \
    device/samsung/jet/prebuilt/jet/3dpack/egl/libGLESv2_fimg.so:system/lib/egl/libGLESv2_fimg.so
else
PRODUCT_COPY_FILES += \
    device/samsung/jet/prebuilt/jet/fimg-libs/libChunkAlloc.so:system/lib/egl/libChunkAlloc.so \
    device/samsung/jet/prebuilt/jet/fimg-libs/libEGL_fimg.so:system/lib/egl/libEGL_fimg.so \
    device/samsung/jet/prebuilt/jet/fimg-libs/libGLESv1_CM_fimg.so:system/lib/egl/libGLESv1_CM_fimg.so \
    device/samsung/jet/prebuilt/jet/fimg-libs/libGLESv2_fimg.so:system/lib/egl/libGLESv2_fimg.so
endif

#
# Keys
#
PRODUCT_COPY_FILES += \
    device/samsung/jet/prebuilt/jet/keys/s3c-keypad-rev0020.kl:system/usr/keylayout/s3c-keypad-rev0020.kl \
    device/samsung/jet/prebuilt/jet/keys/sec_headset.kl:system/usr/keylayout/sec_headset.kl \
    device/samsung/jet/prebuilt/jet/keys/s3c-keypad-rev0020.kcm.bin:system/usr/keychars/s3c-keypad-rev0020.kcm.bin

#
# Only one left: copybit
#
PRODUCT_COPY_FILES += \
    device/samsung/jet/prebuilt/jet/akmd/akmd:system/bin/akmdso

#
# Vold
#
PRODUCT_COPY_FILES += \
    device/samsung/jet/prebuilt/jet/vold/vold.fstab:system/etc/vold.fstab \
    device/samsung/jet/prebuilt/jet/vold/vold.conf:system/etc/vold.conf

#
# RIL
#
PRODUCT_COPY_FILES += \
    device/samsung/jet/prebuilt/jet/ril/drexe:system/bin/drexe \
    device/samsung/jet/prebuilt/jet/ril/efsd:system/bin/efsd \
    device/samsung/jet/prebuilt/jet/ril/rilclient-test:system/bin/rilclient-test \
    device/samsung/jet/prebuilt/jet/ril/libsec-ril.so:system/lib/libsec-ril.so

#
# GSM APN list
#
PRODUCT_COPY_FILES += \
    vendor/jetdroid/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

#
# Audio
#
PRODUCT_COPY_FILES += \
    device/samsung/jet/prebuilt/jet/audio/asound.conf:system/etc/asound.conf

#
# SamdroidTools
#
PRODUCT_COPY_FILES += \
    device/samsung/jet/prebuilt/jet/samdroidtools/SamdroidTools.apk:system/app/SamdroidTools.apk \
    device/samsung/jet/prebuilt/jet/samdroidtools/libsamdroidtools.so:system/lib/libsamdroidtools.so

#
# RockPlayer for temporary DivX
#
PRODUCT_COPY_FILES += \
    device/samsung/jet/prebuilt/jet/rockplayer/RockPlayer.apk:system/app/RockPlayer.apk \
    device/samsung/jet/prebuilt/jet/rockplayer/libcmplayer.so:system/bin/rockplayer/libcmplayer.so \
    device/samsung/jet/prebuilt/jet/rockplayer/libcmplayer_7.so:system/bin/rockplayer/libcmplayer_7.so \
    device/samsung/jet/prebuilt/jet/rockplayer/libffmpeg.so:system/bin/rockplayer/libffmpeg.so

#
# dirty hack for OpenVPN
#
PRODUCT_COPY_FILES += \
    device/samsung/jet/prebuilt/jet/vpn/openvpn.apk:system/app/OpenVPN.apk

#
# serviceModeApp
#
PRODUCT_COPY_FILES += \
    device/samsung/jet/prebuilt/jet/servicemodeapp/serviceModeApp.apk:system/app/serviceModeApp.apk

#
# Bluetooth
#
PRODUCT_COPY_FILES += \
    device/samsung/jet/prebuilt/jet/bt/BCM4325D1_004.002.004.0153.0173.hcd:system/bin/BCM4325D1_004.002.004.0153.0173.hcd

#
# system/sd
#
PRODUCT_COPY_FILES += \
    device/samsung/jet/prebuilt/jet/placeholder/.placeholder:system/sd/.placeholder

#
# Setup device specific product configuration.
#
PRODUCT_NAME := full_jet
PRODUCT_DEVICE := GT-S8000
PRODUCT_MODEL := GT-S8000
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung

