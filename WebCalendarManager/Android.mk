LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := WebCalendarManager
LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := WebCalendarManager-2.2-beta.1-standard-release-unsigned.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
include $(BUILD_PREBUILT)
