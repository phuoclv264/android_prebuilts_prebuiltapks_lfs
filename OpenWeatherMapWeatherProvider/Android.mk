LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := OpenWeatherMapWeatherProvider
LOCAL_CERTIFICATE := platform

ifeq ($(PLATFORM_SDK_VERSION), 28)
  LOCAL_SRC_FILES := OpenWeatherMapWeatherProvider-oreo.apk
else ifeq ($(PLATFORM_SDK_VERSION), 29)
  LOCAL_SRC_FILES := OpenWeatherMapWeatherProvider-q.apk
else ifeq ($(PLATFORM_SDK_VERSION), 30)
  LOCAL_SRC_FILES := OpenWeatherMapWeatherProvider-r.apk
else
  LOCAL_SRC_FILES := OpenWeatherMapWeatherProvider-s.apk
endif

LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
include $(BUILD_PREBUILT)
