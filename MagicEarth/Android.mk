LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := MagicEarth
ifeq ($(TARGET_ARCH), $(filter $(TARGET_ARCH), x86_64))
    LOCAL_SRC_FILES := MagicEarth-x86.apk
else
    LOCAL_SRC_FILES := MagicEarth-$(TARGET_ARCH).apk
endif
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
ifneq ($(call math_gt_or_eq, $(PLATFORM_SDK_VERSION), 33),)
LOCAL_CERTIFICATE := platform
else
LOCAL_CERTIFICATE := PRESIGNED
endif
LOCAL_REQUIRED_MODULES := libMagicEarthSphereNative.so
ifneq ($(call math_gt_or_eq, $(PLATFORM_SDK_VERSION), 31),)
LOCAL_OPTIONAL_USES_LIBRARIES := com.sec.android.app.multiwindow
endif
include $(BUILD_PREBUILT)

ifeq ($(TARGET_ARCH), $(filter $(TARGET_ARCH), arm64))
    LIB_PATH := lib/arm64-v8a
else ifeq ($(TARGET_ARCH), $(filter $(TARGET_ARCH), arm))
    LIB_PATH := lib/armeabi-v7a
else ifeq ($(TARGET_ARCH), $(filter $(TARGET_ARCH), x86_64))
    LIB_PATH := lib/x86
else ifeq ($(TARGET_ARCH), $(filter $(TARGET_ARCH), x86))
    LIB_PATH := lib/x86
endif

include $(CLEAR_VARS)
LOCAL_MODULE := libMagicEarthSphereNative.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_CHECK_ELF_FILES := false
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)
LOCAL_SRC_FILES := $(LIB_PATH)/libMagicEarthSphereNative.so
include $(BUILD_PREBUILT)
