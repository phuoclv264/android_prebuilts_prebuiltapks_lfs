LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := BlissLauncher
LOCAL_CERTIFICATE := platform

# the ok part is necessary: https://stackoverflow.com/questions/3442304/performing-greater-than-less-than-calculations-in-a-makefile/44288938#44288938
$(if $(shell [ $(PLATFORM_SDK_VERSION) -ge 29 ] && echo "ok"), \
    $(eval BUILD_GREATER_THAN_PIE := true), \
    $(eval BUILD_GREATER_THAN_PIE := false))

ifeq ($(PLATFORM_SDK_VERSION), 25)
  LOCAL_SRC_FILES := app-apiNougat-release-unsigned.apk
else ifeq ($(PLATFORM_SDK_VERSION), 27)
  LOCAL_SRC_FILES := app-apiOreo-release-unsigned.apk
else ifeq ($(PLATFORM_SDK_VERSION), 28)
  LOCAL_SRC_FILES := app-apiOreo-release-unsigned.apk
else ifeq ($(PLATFORM_SDK_VERSION), 29)
  LOCAL_SRC_FILES := app-apiQ-release-unsigned.apk
else
  LOCAL_SRC_FILES := app-apiR-release-unsigned.apk
endif

LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
ifeq ($(BUILD_GREATER_THAN_PIE),true)
  LOCAL_REQUIRED_MODULES := privapp_whitelist_foundation.e.blisslauncher.xml
  include $(BUILD_PREBUILT)

  include $(CLEAR_VARS)
  LOCAL_MODULE := privapp_whitelist_foundation.e.blisslauncher.xml
  LOCAL_MODULE_CLASS := ETC
  LOCAL_MODULE_TAGS := optional
  LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions
  LOCAL_PRODUCT_MODULE := true
  LOCAL_SRC_FILES := $(LOCAL_MODULE)
endif

include $(BUILD_PREBUILT)
