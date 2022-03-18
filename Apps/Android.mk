LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := Apps
LOCAL_CERTIFICATE := platform

ifeq ($(PLATFORM_SDK_VERSION), 25)
  LOCAL_SRC_FILES := app-release-unsigned-nougat.apk
else ifeq ($(PLATFORM_SDK_VERSION), 27)
  LOCAL_SRC_FILES := app-release-unsigned.apk
else ifeq ($(RELEASE_TYPE), test)
  LOCAL_SRC_FILES := app-debug.apk
else ifeq ($(RELEASE_TYPE), dev)
  LOCAL_SRC_FILES := app-releaseDev.apk
else
  LOCAL_SRC_FILES := app-release-unsigned.apk
endif

LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
include $(BUILD_PREBUILT)
