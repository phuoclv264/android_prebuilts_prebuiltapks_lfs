LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := Notes
LOCAL_CERTIFICATE := platform

ifeq ($(PLATFORM_SDK_VERSION), 25)
  LOCAL_SRC_FILES := app-release-unsigned-nougat.apk
else
  LOCAL_SRC_FILES := app-release-unsigned.apk
endif

LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
include $(BUILD_PREBUILT)
