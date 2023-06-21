LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := Talkback
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := $(DEFAULT_SYSTEM_DEV_CERTIFICATE)
LOCAL_SRC_FILES := talkback-foss-phone-release-unsigned.apk
LOCAL_OPTIONAL_USES_LIBRARIES := com.google.android.wearable androidx.window.extensions androidx.window.sidecar
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)
