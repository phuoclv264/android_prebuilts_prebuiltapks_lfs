LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := Message
LOCAL_CERTIFICATE := platform
LOCAL_OVERRIDES_PACKAGES := messaging

ifeq ($(PLATFORM_SDK_VERSION), 25)
  LOCAL_SRC_FILES := presentation-noAnalytics-universal-release-unsigned-nougat.apk
else
  LOCAL_SRC_FILES := presentation-noAnalytics-universal-release-unsigned.apk
endif

LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
include $(BUILD_PREBUILT)
