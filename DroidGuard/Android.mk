LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := DroidGuard
LOCAL_PRODUCT_MODULE := true
LOCAL_SRC_FILES := remote-droid-guard-release-unsigned.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := shared
include $(BUILD_PREBUILT)
