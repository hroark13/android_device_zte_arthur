$(call inherit-product, build/target/product/full.mk)

$(call inherit-product, build/target/product/languages_small.mk)
$(call inherit-product, vendor/cm/config/common.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

$(call inherit-product-if-exists, vendor/zte/arthur/arthur-vendor.mk)

DEVICE_PACKAGE_OVERLAYS := device/zte/arthur/overlay
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PROPERTY_OVERRIDES+= dalvik.vm.execution-mode=int:jit \
	ro.telephony.call_ring.multiple=false \
	ro.telephony.call_ring.delay=5000 \
	dalvik.vm.dexopt-flags=m=y,u=n,v=a,o=v \
	debug.enabletr=true \
	persist.sys.use_dithering=0 \
	ro.com.google.locationfeatures=1 \
	mobiledata.interfaces = wlan0,rmnet0

# Provides overrides to configure the Dalvik heap for a standard tablet device.

PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.heapstartsize=5m \
	dalvik.vm.heapgrowthlimit=48m \
	dalvik.vm.heapsize=256m

PRODUCT_LOCALES += hdpi

PRODUCT_AAPT_CONFIG := hdpi

#LLVM for RenderScript
LLVM_ROOT_PATH := external/llvm

PRODUCT_PACKAGES += \
	lights.msm7x30 \
	applypatch \
	ast-mm-vdec-omx-test \
	com.android.future.usb.accessory \
	gps.default \
	libaudioutils \
	libdivxdrmdecrypt \
	libinvensense_hal \
	liblasic \
	liblinenoise \
	libmemalloc \
	libmllite \
	libmlplatform \
	libmmjpeg_interface \
	libmm-omxcore \
	libOmxAacEnc \
	libOmxAmrEnc \
	libOmxCore \
	libOmxEvrcEnc \
	libOmxQcelp13Enc \
	libOmxVdec \
	libOmxVenc \
	libOmxVidEnc \
	libOpenMAXAL \
	libOpenSLES \
	librs_jni \
	libstagefrighthw \
	LiveWallpapers \
	LiveWallpapersPicker \
	make_ext4fs \
	mm-vdec-omx-property-mgr \
	mm-vdec-omx-test \
	mm-venc-omx-test \
	mm-venc-omx-test720p \
	mm-video-driver-test \
	mm-video-encdrv-test \
	setup_fs 

## Bluetooth
#PRODUCT_PACKAGES += \
	#hciattach \
	#hciconfig \
	#hcitool \
	#hdmid \

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml \
	device/zte/arthur/prebuilt/files/etc/permissions/com.google.android.media.effects.xml:/system/etc/permissions/com.google.android.media.effects.xml 

# Root
PRODUCT_COPY_FILES += \
    device/zte/arthur/root/default.prop:/root/default.prop \
    device/zte/arthur/root/init:/root/init \
    device/zte/arthur/root/init.arthur.rc:/root/init.arthur.rc \
    device/zte/arthur/root/init.goldfish.rc:/root/init.goldfish.rc \
    device/zte/arthur/root/initlogo.rle:/root/initlogo.rle \
    device/zte/arthur/root/init.qcom.rc:/root/init.qcom.rc \
    device/zte/arthur/root/init.qcom.sh:/root/init.qcom.sh \
    device/zte/arthur/root/init.rc:/root/init.rc \
    device/zte/arthur/root/init.trace.rc:/root/init.trace.rc \
    device/zte/arthur/root/init.usb.rc:/root/init.usb.rc \
    device/zte/arthur/root/logo.bmp:/root/logo.bmp \
    device/zte/arthur/root/membank.sh:/root/membank.sh \
    device/zte/arthur/root/ueventd.arthur.rc:/root/ueventd.arthur.rc \
    device/zte/arthur/root/ueventd.goldfish.rc:/root/ueventd.goldfish.rc \
    device/zte/arthur/root/ueventd.rc:/root/ueventd.rc \
    device/zte/arthur/root/sbin/adbd:/root/sbin/adbd \
    device/zte/arthur/root/sbin/diagftmtest:/root/sbin/diagftmtest \
    device/zte/arthur/root/sbin/hci_qcomm_init:/root/sbin/hci_qcomm_init \
    device/zte/arthur/root/sbin/iwmulticall:/root/sbin/iwmulticall \
    device/zte/arthur/root/sbin/iwpriv:/root/sbin/iwpriv \
    device/zte/arthur/root/sbin/ptt_socket_app:/root/sbin/ptt_socket_app \
    device/zte/arthur/root/sbin/rmt_storage:/root/sbin/rmt_storage \
    device/zte/arthur/root/sbin/ueventd:/root/sbin/ueventd \
    device/zte/arthur/root/sbin/usbconfig:/root/sbin/usbconfig


# Recovery
PRODUCT_COPY_FILES += \
	device/zte/arthur/recovery/root/init.rc:/recovery/root/init.rc \
	device/zte/arthur/recovery/root/ueventd.rc:/recovery/root/ueventd.rc \
	device/zte/arthur/root/sbin/diagftmtest:/recovery/root/sbin/diagftmtest \
	device/zte/arthur/root/sbin/hci_qcomm_init:/recovery/root/sbin/hci_qcomm_init \
	device/zte/arthur/root/sbin/iwmulticall:/recovery/root/sbin/iwmulticall \
	device/zte/arthur/root/sbin/iwpriv:/recovery/root/sbin/iwpriv \
	device/zte/arthur/root/sbin/ptt_socket_app:/recovery/root/sbin/ptt_socket_app \
	device/zte/arthur/root/sbin/rmt_storage:/recovery/root/sbin/rmt_storage \
	device/zte/arthur/root/sbin/usbconfig:/recovery/root/sbin/usbconfig

# Display EGL/GPU ICS
PRODUCT_PACKAGES += \
    gralloc.msm7x30 \
    hwcomposer.msm7x30 \
    copybit.msm7x30

PRODUCT_COPY_FILES += \
    device/zte/arthur/prebuilt/files/etc/firmware/a225_pfp.fw:system/etc/firmware/a225_pfp.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/a225_pm4.fw:system/etc/firmware/a225_pm4.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/a225p5_pm4.fw:system/etc/firmware/a225p5_pm4.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/a300_pfp.fw:system/etc/firmware/a300_pfp.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/a300_pm4.fw:system/etc/firmware/a300_pm4.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/dsps_fluid.b00:system/etc/firmware/dsps_fluid.b00 \
    device/zte/arthur/prebuilt/files/etc/firmware/dsps_fluid.b01:system/etc/firmware/dsps_fluid.b01 \
    device/zte/arthur/prebuilt/files/etc/firmware/dsps_fluid.b02:system/etc/firmware/dsps_fluid.b02 \
    device/zte/arthur/prebuilt/files/etc/firmware/dsps_fluid.b03:system/etc/firmware/dsps_fluid.b03 \
    device/zte/arthur/prebuilt/files/etc/firmware/dsps_fluid.mdt:system/etc/firmware/dsps_fluid.mdt \
    device/zte/arthur/prebuilt/files/etc/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/vidc_1080p.fw:system/etc/firmware/vidc_1080p.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/zte/arthur/prebuilt/files/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    device/zte/arthur/prebuilt/files/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
    device/zte/arthur/prebuilt/files/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
    device/zte/arthur/prebuilt/files/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/zte/arthur/prebuilt/files/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
    device/zte/arthur/prebuilt/files/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/zte/arthur/prebuilt/files/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/zte/arthur/prebuilt/files/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    device/zte/arthur/prebuilt/files/lib/libC2D2.so:system/lib/libC2D2.so \
    device/zte/arthur/prebuilt/files/lib/libgsl.so:system/lib/libgsl.so \
    device/zte/arthur/prebuilt/files/lib/libOpenVG.so:system/lib/libOpenVG.so \
    device/zte/arthur/prebuilt/files/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so

# Legacy Touch Screen
PRODUCT_COPY_FILES += \
	device/zte/arthur/prebuilt/files/usr/idc/synaptics-rmi4-ts.idc:system/usr/idc/synaptics-rmi4-ts.idc

# Audio
PRODUCT_PACKAGES += \
    audio_policy.msm7x30 \
    audio.primary.msm7x30
#    audio.usb.default \
#    audio.a2dp.default \
#    audio_policy.conf \
#    libaudioutils

PRODUCT_COPY_FILES += \
	device/zte/arthur/prebuilt/b08c/lib/libaudioalsa.so:obj/lib/libaudioalsa.so \
	device/zte/arthur/prebuilt/b08c/lib/libaudioalsa.so:system/lib/libaudioalsa.so
	#device/zte/arthur/prebuilt/b08c/lib/libaudio.so:obj/lib/libaudio.so \
	#device/zte/arthur/prebuilt/b08c/lib/libaudio.so:system/lib/libaudio.so \
	#device/zte/arthur/prebuilt/b08c/lib/libaudiopolicy.so:obj/lib/libaudiopolicy.so \
	#device/zte/arthur/prebuilt/b08c/lib/libaudiopolicy.so:system/lib/libaudiopolicy.so \

# WiFi
PRODUCT_PACKAGES += \
	libwpa_client

PRODUCT_COPY_FILES += \
	device/zte/arthur/prebuilt/b08c/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh \
	device/zte/arthur/prebuilt/b08c/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
	device/zte/arthur/prebuilt/b08c/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
	device/zte/arthur/prebuilt/b08c/etc/firmware/wlan/cfg.dat:system/etc/firmware/wlan/cfg.dat \
	device/zte/arthur/prebuilt/b08c/etc/firmware/wlan/qcom_cfg.ini:system/etc/firmware/wlan/qcom_cfg.ini \
	device/zte/arthur/prebuilt/b08c/etc/firmware/wlan/qcom_fw.bin:system/etc/firmware/wlan/qcom_fw.bin \
	device/zte/arthur/prebuilt/b08c/etc/firmware/wlan/qcom_wapi_fw.bin:system/etc/firmware/wlan/qcom_wapi_fw.bin \
	device/zte/arthur/prebuilt/b08c/etc/firmware/wlan/qcom_wlan_nv.bin:system/etc/firmware/wlan/qcom_wlan_nv.bin \
	device/zte/arthur/prebuilt/b08c/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
	device/zte/arthur/prebuilt/files/lib/modules/libra.ko:system/lib/modules/libra.ko \
	device/zte/arthur/prebuilt/files/lib/modules/libra_ftm.ko:system/lib/modules/libra_ftm.ko \
	device/zte/arthur/prebuilt/files/lib/modules/librasdioif.ko:system/lib/modules/librasdioif.ko

# Camera
PRODUCT_PACKAGES += \
    LegacyCamera \
    camera.msm7x30

PRODUCT_COPY_FILES += \
	device/zte/arthur/prebuilt/b08c/bin/mm-qcamera-test:system/bin/mm-qcamera-test \
	device/zte/arthur/prebuilt/b08c/bin/mm-qcamera-testsuite-client:system/bin/mm-qcamera-testsuite-client \
	device/zte/arthur/prebuilt/b08c/lib/libgemini.so:system/lib/libgemini.so \
	device/zte/arthur/prebuilt/b08c/lib/libmmipl.so:system/lib/libmmipl.so \
	device/zte/arthur/prebuilt/b08c/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
	device/zte/arthur/prebuilt/b08c/lib/libmmjpeg.so:obj/lib/libmmjpeg.so \
	device/zte/arthur/prebuilt/b08c/lib/liboemcamera.so:system/lib/liboemcamera.so \
	device/zte/arthur/prebuilt/b08c/lib/liboemcamera.so:obj/lib/liboemcamera.so \
	device/zte/arthur/prebuilt/b08c/lib/libcamera.so:obj/lib/libcamera.so \
	device/zte/arthur/prebuilt/b08c/lib/libcamera.so:system/lib/libcamera.so

# B08c bin
PRODUCT_COPY_FILES += \
	device/zte/arthur/prebuilt/b08c/bin/akmd8962:system/bin/akmd8962 \
	device/zte/arthur/prebuilt/b08c/bin/at-daemon:system/bin/at-daemon \
	device/zte/arthur/prebuilt/b08c/bin/battery_charging:system/bin/battery_charging \
	device/zte/arthur/prebuilt/b08c/bin/bluetoothd:system/bin/bluetoothd \
	device/zte/arthur/prebuilt/b08c/bin/bt_testmode.sh:system/bin/bt_testmode.sh \
	device/zte/arthur/prebuilt/b08c/bin/btwlancoex:system/bin/btwlancoex \
	device/zte/arthur/prebuilt/b08c/bin/CKPD-daemon:system/bin/CKPD-daemon \
	device/zte/arthur/prebuilt/b08c/bin/DrmHost:system/bin/DrmHost \
	device/zte/arthur/prebuilt/b08c/bin/ds_fmc_appd:system/bin/ds_fmc_appd \
	device/zte/arthur/prebuilt/b08c/bin/fm_qsoc_patches:system/bin/fm_qsoc_patches \
	device/zte/arthur/prebuilt/b08c/bin/getlogtofile:system/bin/getlogtofile \
	device/zte/arthur/prebuilt/b08c/bin/hci_qcomm_init:system/bin/hci_qcomm_init \
	device/zte/arthur/prebuilt/b08c/bin/hciattach:system/bin/hciattach \
	device/zte/arthur/prebuilt/b08c/bin/hciconfig:system/bin/hciconfig \
	device/zte/arthur/prebuilt/b08c/bin/hcitool:system/bin/hcitool \
	device/zte/arthur/prebuilt/b08c/bin/hdmid:system/bin/hdmid \
	device/zte/arthur/prebuilt/b08c/bin/hlr_auc_gw:system/bin/hlr_auc_gw \
	device/zte/arthur/prebuilt/b08c/bin/hostapd:system/bin/hostapd \
	device/zte/arthur/prebuilt/b08c/bin/hostapd_cli:system/bin/hostapd_cli \
	device/zte/arthur/prebuilt/b08c/bin/init.btprop.sh:system/bin/init.btprop.sh \
	device/zte/arthur/prebuilt/b08c/bin/iprenew:system/bin/iprenew \
	device/zte/arthur/prebuilt/b08c/bin/loc_api_app:system/bin/loc_api_app \
	device/zte/arthur/prebuilt/b08c/bin/netmgrd:system/bin/netmgrd \
	device/zte/arthur/prebuilt/b08c/bin/port-bridge:system/bin/port-bridge \
	device/zte/arthur/prebuilt/b08c/bin/proximity.init:system/bin/proximity.init \
	device/zte/arthur/prebuilt/b08c/bin/qmuxd:system/bin/qmuxd \
	device/zte/arthur/prebuilt/b08c/bin/rild:obj/bin/rild \
	device/zte/arthur/prebuilt/b08c/bin/rild:system/bin/rild \
	device/zte/arthur/prebuilt/b08c/bin/rmt_storage:system/bin/rmt_storage \
	device/zte/arthur/prebuilt/b08c/bin/sdcard:system/bin/sdcard \
	device/zte/arthur/prebuilt/b08c/bin/sdptool:system/bin/sdptool \
	device/zte/arthur/prebuilt/b08c/bin/sprintdiag:system/bin/sprintdiag \
	device/zte/arthur/prebuilt/b08c/bin/thermald:system/bin/thermald \
	device/zte/arthur/prebuilt/b08c/bin/usbhub:system/bin/usbhub \
	device/zte/arthur/prebuilt/b08c/bin/usbhub_init:system/bin/usbhub_init \
	device/zte/arthur/prebuilt/b08c/bin/wpa_supplicant:system/bin/wpa_supplicant

# B08c etc
PRODUCT_COPY_FILES += \
	device/zte/arthur/prebuilt/b08c/etc/thermald.conf:system/etc/thermald.conf \
	device/zte/arthur/prebuilt/b08c/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
	device/zte/arthur/prebuilt/b08c/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
	device/zte/arthur/prebuilt/b08c/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
	device/zte/arthur/prebuilt/b08c/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
	device/zte/arthur/prebuilt/b08c/etc/vold.fstab:system/etc/vold.fstab \

# hostapd
PRODUCT_PACKAGES += \
	hostapd \
	hostapd_cli

PRODUCT_COPY_FILES += \
	device/zte/arthur/prebuilt/b08c/hostapd/hostapd.accept:system/hostapd/hostapd.accept \
	device/zte/arthur/prebuilt/b08c/hostapd/hostapd.conf:system/hostapd/hostapd.conf \
	device/zte/arthur/prebuilt/b08c/hostapd/hostapd.deny:system/hostapd/hostapd.deny \
	device/zte/arthur/prebuilt/b08c/qcom/softap/hostapd_default.conf:system/qcom/softap/hostapd_default.conf

# B08c lib
PRODUCT_COPY_FILES += \
	device/zte/arthur/prebuilt/b08c/lib/bluez-plugin/audio.so:system/lib/bluez-plugin/audio.so \
	device/zte/arthur/prebuilt/b08c/lib/bluez-plugin/input.so:system/lib/bluez-plugin/input.so \
	device/zte/arthur/prebuilt/b08c/lib/hw/sensors.default.so:system/lib/hw/sensors.msm7x30.so \
	device/zte/arthur/prebuilt/b08c/lib/libauth.so:system/lib/libauth.so \
	device/zte/arthur/prebuilt/b08c/lib/libcm.so:system/lib/libcm.so \
	device/zte/arthur/prebuilt/b08c/lib/libcommondefs.so:obj/lib/libcommondefs.so \
	device/zte/arthur/prebuilt/b08c/lib/libcommondefs.so:system/lib/libcommondefs.so \
	device/zte/arthur/prebuilt/b08c/lib/libdiag.so:obj/lib/libdiag.so \
	device/zte/arthur/prebuilt/b08c/lib/libdiag.so:system/lib/libdiag.so \
	device/zte/arthur/prebuilt/b08c/lib/libdsi_netctrl.so:system/lib/libdsi_netctrl.so \
	device/zte/arthur/prebuilt/b08c/lib/libdsm.so:system/lib/libdsm.so \
	device/zte/arthur/prebuilt/b08c/lib/libdss.so:system/lib/libdss.so \
	device/zte/arthur/prebuilt/b08c/lib/libdsutils.so:system/lib/libdsutils.so \
	device/zte/arthur/prebuilt/b08c/lib/libgps.so:system/lib/libgps.so \
	device/zte/arthur/prebuilt/b08c/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
	device/zte/arthur/prebuilt/b08c/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
	device/zte/arthur/prebuilt/b08c/lib/libidl.so:system/lib/libidl.so \
	device/zte/arthur/prebuilt/b08c/lib/libloc_api-rpc-qc.so:system/lib/libloc_api-rpc-qc.so \
	device/zte/arthur/prebuilt/b08c/lib/libloc_ext.so:system/lib/libloc_ext.so \
	device/zte/arthur/prebuilt/b08c/lib/libloc-rpc.so:system/lib/libloc-rpc.so \
	device/zte/arthur/prebuilt/b08c/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
	device/zte/arthur/prebuilt/b08c/lib/libmmosal.so:system/lib/libmmosal.so \
	device/zte/arthur/prebuilt/b08c/lib/libmmparser.so:system/lib/libmmparser.so \
	device/zte/arthur/prebuilt/b08c/lib/libmmparser_divxdrmlib.so:system/lib/libmmparser_divxdrmlib.so \
	device/zte/arthur/prebuilt/b08c/lib/libnetmgr.so:system/lib/libnetmgr.so \
	device/zte/arthur/prebuilt/b08c/lib/libnv.so:system/lib/libnv.so \
	device/zte/arthur/prebuilt/b08c/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
	device/zte/arthur/prebuilt/b08c/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
	device/zte/arthur/prebuilt/b08c/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
	device/zte/arthur/prebuilt/b08c/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
	device/zte/arthur/prebuilt/b08c/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
	device/zte/arthur/prebuilt/b08c/lib/libOmxQcelp13Dec.so:system/lib/libOmxQcelp13Dec.so \
	device/zte/arthur/prebuilt/b08c/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
	device/zte/arthur/prebuilt/b08c/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
	device/zte/arthur/prebuilt/b08c/lib/liboncrpc.so:system/lib/liboncrpc.so \
	device/zte/arthur/prebuilt/b08c/lib/libpbmlib.so:system/lib/libpbmlib.so \
	device/zte/arthur/prebuilt/b08c/lib/libpdapi.so:system/lib/libpdapi.so \
	device/zte/arthur/prebuilt/b08c/lib/libpdsm_atl.so:system/lib/libpdsm_atl.so \
	device/zte/arthur/prebuilt/b08c/lib/libqdp.so:system/lib/libqdp.so \
	device/zte/arthur/prebuilt/b08c/lib/libqmi.so:system/lib/libqmi.so \
	device/zte/arthur/prebuilt/b08c/lib/libqmiservices.so:system/lib/libqmiservices.so \
	device/zte/arthur/prebuilt/b08c/lib/libqueue.so:system/lib/libqueue.so \
	device/zte/arthur/prebuilt/b08c/lib/libQWiFiSoftApCfg.so:system/lib/libQWiFiSoftApCfg.so \
	device/zte/arthur/prebuilt/b08c/lib/libreference-cdma-sms.so:system/lib/libreference-cdma-sms.so \
	device/zte/arthur/prebuilt/b08c/lib/libreference-ril.so:obj/lib/libreference-ril.so \
	device/zte/arthur/prebuilt/b08c/lib/libreference-ril.so:system/lib/libreference-ril.so \
	device/zte/arthur/prebuilt/b08c/lib/libril.so:obj/lib/libril.so \
	device/zte/arthur/prebuilt/b08c/lib/libril.so:system/lib/libril.so \
	device/zte/arthur/prebuilt/b08c/lib/libril-qc-1.so:system/lib/libril-qc-1.so \
	device/zte/arthur/prebuilt/b08c/lib/libril-qc-qmi-1.so:system/lib/libril-qc-qmi-1.so \
	device/zte/arthur/prebuilt/b08c/lib/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
	device/zte/arthur/prebuilt/b08c/lib/libuim.so:system/lib/libuim.so \
	device/zte/arthur/prebuilt/b08c/lib/libwms.so:system/lib/libwms.so \
	device/zte/arthur/prebuilt/b08c/lib/libwmsts.so:system/lib/libwmsts.so

# B08c usr/Keychars/Keylayout 
PRODUCT_COPY_FILES += \
    device/zte/arthur/prebuilt/b08c/usr/icu/icudt44l.dat:system/usr/icu/icudt44l.dat \
    device/zte/arthur/prebuilt/b08c/usr/keychars/arthur_keypad_numeric.kcm.bin:system/usr/keychars/arthur_keypad_numeric.kcm.bin \
    device/zte/arthur/prebuilt/b08c/usr/keychars/arthur_keypad_qwerty.kcm.bin:system/usr/keychars/arthur_keypad_qwerty.kcm.bin \
    device/zte/arthur/prebuilt/b08c/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/zte/arthur/prebuilt/b08c/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/zte/arthur/prebuilt/b08c/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/zte/arthur/prebuilt/b08c/usr/keylayout/arthur_keypad.kl:system/usr/keylayout/arthur_keypad.kl \
    device/zte/arthur/prebuilt/b08c/usr/keylayout/fluid-keypad.kl:system/usr/keylayout/fluid-keypad.kl \
    device/zte/arthur/prebuilt/b08c/usr/keylayout/msm_tma300_ts.kl:system/usr/keylayout/msm_tma300_ts.kl

# Boot Animation
#PRODUCT_COPY_FILES += \
#device/zte/arthur/prebuilt/files/media/bootanimation.zip:system/media/bootanimation.zip

############ getting ignored for some reason 
#frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
#device/zte/arthur/prebuilt/b08c/etc/apns-conf.xml:system/etc/apns-conf.xml \
#device/zte/arthur/prebuilt/b08c/etc/bluetooth/input.conf:system/etc/bluetooth/input.conf \
#device/zte/arthur/prebuilt/b08c/etc/bluetooth/main.conf:system/etc/bluetooth/main.conf
#device/zte/arthur/prebuilt/b08c/etc/bluetooth/network.conf:system/etc/bluetooth/network.conf \

########### not in b08c
#device/zte/arthur/prebuilt/b08c/bin/ATFWD-daemon:system/bin/ATFWD-daemon \
#device/zte/arthur/prebuilt/b08c/bin/brcm_patchram_plus:system/bin/brcm_patchram_plus \
#device/zte/arthur/prebuilt/b08c/bin/bridgemgrd:system/bin/bridgemgrd \
#device/zte/arthur/prebuilt/b08c/bin/dcvsd:system/bin/dcvsd \
#device/zte/arthur/prebuilt/b08c/bin/mm-mpo-enc-test:system/bin/mm-mpo-enc-test \
#device/zte/arthur/prebuilt/b08c/bin/mm-qcamera-daemon:system/bin/mm-qcamera-daemon \
#device/zte/arthur/prebuilt/b08c/bin/mpdecision:system/bin/mpdecision \
#device/zte/arthur/prebuilt/b08c/bin/qmiproxy:system/bin/qmiproxy \
#device/zte/arthur/prebuilt/b08c/bin/radish:system/bin/radish \
#device/zte/arthur/prebuilt/b08c/bin/v4l2-qcamera-app:system/bin/v4l2-qcamera-app \
#device/zte/arthur/prebuilt/b08c/bin/wiperiface:system/bin/wiperiface \
#device/zte/arthur/prebuilt/b08c/etc/init.qcom.mdm_links.sh:system/etc/init.qcom.mdm_links.sh \
#device/zte/arthur/prebuilt/b08c/etc/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh \
#device/zte/arthur/prebuilt/b08c/etc/media_codecs.xml:system/etc/media_codecs.xml \
#device/zte/arthur/prebuilt/b08c/etc/media_profiles.xml:system/etc/media_profiles.xml \
#device/zte/arthur/prebuilt/b08c/lib/libacdbloader.so:obj/lib/libacdbloader.so \
#device/zte/arthur/prebuilt/b08c/lib/libacdbloader.so:system/lib/libacdbloader.so \
#device/zte/arthur/prebuilt/b08c/lib/libacdbmapper.so:obj/lib/libacdbmapper.so \
#device/zte/arthur/prebuilt/b08c/lib/libacdbmapper.so:system/lib/libacdbmapper.so \
#device/zte/arthur/prebuilt/b08c/lib/libaudcal.so:obj/lib/libaudcal.so \
#device/zte/arthur/prebuilt/b08c/lib/libaudcal.so:system/lib/libaudcal.so \
#device/zte/arthur/prebuilt/b08c/lib/libmllite.so:system/lib/libmllite.so \
#device/zte/arthur/prebuilt/b08c/lib/libmlplatform.so:system/lib/libmlplatform.so \
#device/zte/arthur/prebuilt/b08c/lib/libmmmpo.so:system/lib/libmmmpo.so \
#device/zte/arthur/prebuilt/b08c/lib/libmpl.so:system/lib/libmpl.so \
#device/zte/arthur/prebuilt/b08c/lib/libmpl_sys_jni.so:system/lib/libmpl_sys_jni.so \
#device/zte/arthur/prebuilt/b08c/lib/libtcpfinaggr.so:system/lib/libtcpfinaggr.so \
#device/zte/arthur/prebuilt/b08c/lib/libtime_genoff.so:system/lib/libtime_genoff.so \
#device/zte/arthur/prebuilt/b08c/lib/libwiperjni.so:system/lib/libwiperjni.so \
