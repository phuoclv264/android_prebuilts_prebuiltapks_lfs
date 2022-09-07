LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := MagicEarth
LOCAL_SRC_FILES := MagicEarth-$(TARGET_ARCH).apk
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_REQUIRED_MODULES := libMagicEarthNative.so
ifneq ($(call math_gt_or_eq, $(PLATFORM_SDK_VERSION), 31),)
LOCAL_OPTIONAL_USES_LIBRARIES := com.sec.android.app.multiwindow
endif
include $(BUILD_PREBUILT)

ifeq ($(TARGET_ARCH), $(filter $(TARGET_ARCH), arm64))
    LIB_PATH := lib/arm64-v8a
else ifeq ($(TARGET_ARCH), $(filter $(TARGET_ARCH), arm))
    LIB_PATH := lib/armeabi-v7a
else ifeq ($(TARGET_ARCH), $(filter $(TARGET_ARCH), x86_64))
    LIB_PATH := lib/x86_64
else ifeq ($(TARGET_ARCH), $(filter $(TARGET_ARCH), x86))
    LIB_PATH := lib/x86
endif

include $(CLEAR_VARS)
LOCAL_MODULE := libMagicEarthNative.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_CHECK_ELF_FILES := false
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := $(LIB_PATH)/libMagicEarthNative.so
include $(BUILD_PREBUILT)
