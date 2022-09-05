LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := Mail
LOCAL_OVERRIDES_PACKAGES := Email
LOCAL_CERTIFICATE := platform
LOCAL_SRC_FILES := k9mail-release-unsigned.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
ifneq ($(call math_gt_or_eq, $(PLATFORM_SDK_VERSION), 31),)
LOCAL_OPTIONAL_USES_LIBRARIES := com.sec.android.app.multiwindow \
                                 androidx.window.extensions \
                                 androidx.window.sidecar
endif
include $(BUILD_PREBUILT)
