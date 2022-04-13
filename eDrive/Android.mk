LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := eDrive
LOCAL_CERTIFICATE := platform


ifeq ($(PLATFORM_SDK_VERSION), 25)
  LOCAL_SRC_FILES := foundation.e.drive.beta-1-build-n-22-02-02T0746-release-unsigned.apk
else
  LOCAL_SRC_FILES := foundation.e.drive.beta-1-build-o-22-04-13T1409-release-unsigned.apk
endif

LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
include $(BUILD_PREBUILT)
