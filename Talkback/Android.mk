LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_ARCH), $(filter $(TARGET_ARCH), arm64))
    APK_PATH := talkback-foss-phone-arm64-v8a-release-unsigned.apk
else ifeq ($(TARGET_ARCH), $(filter $(TARGET_ARCH), arm))
    APK_PATH := talkback-foss-phone-armeabi-v7a-release-unsigned.apk
else ifeq ($(TARGET_ARCH), $(filter $(TARGET_ARCH), x86_64))
    APK_PATH := talkback-foss-phone-x86_64-release-unsigned.apk
else ifeq ($(TARGET_ARCH), $(filter $(TARGET_ARCH), x86))
    APK_PATH := talkback-foss-phone-x86-release-unsigned.apk
endif

USES_LIBRARY := com.google.android.wearable androidx.window.extensions androidx.window.sidecar

include $(CLEAR_VARS)
LOCAL_MODULE := Talkback
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := $(DEFAULT_SYSTEM_DEV_CERTIFICATE)
LOCAL_SRC_FILES := $(APK_PATH)
ifneq ($(call math_gt_or_eq, $(PLATFORM_SDK_VERSION), 31),)
LOCAL_OPTIONAL_USES_LIBRARIES := $(USES_LIBRARY)
else
LOCAL_PROVIDES_USES_LIBRARY := $(USES_LIBRARY)
endif
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)
