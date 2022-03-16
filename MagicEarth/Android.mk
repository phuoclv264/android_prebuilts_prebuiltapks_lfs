LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := MagicEarth

ifeq ($(TARGET_CPU_ABI), arm64-v8a)
        LOCAL_SRC_FILES := MagicEarth-arm64.apk
else
        LOCAL_SRC_FILES := MagicEarth-arm.apk
endif

LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_REQUIRED_MODULES := libMagicEarthNative.so
include $(BUILD_PREBUILT)


include $(CLEAR_VARS)

LOCAL_MODULE := libMagicEarthNative.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_CHECK_ELF_FILES := false
ifeq ($(TARGET_CPU_ABI), arm64-v8a)
        LOCAL_MODULE_PATH := $(TARGET_OUT)/lib64
        LOCAL_SRC_FILES := arm64-v8a/libMagicEarthNative.so
else
        LOCAL_MODULE_PATH := $(TARGET_OUT)/lib
        LOCAL_SRC_FILES := armeabi-v7a/libMagicEarthNative.so
endif
include $(BUILD_PREBUILT)
