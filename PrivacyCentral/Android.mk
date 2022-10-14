LOCAL_PATH := $(call my-dir)
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
LOCAL_MODULE := privapp-permissions-foundation.e.privacycentralapp.xml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := PrivacyCentral
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true
LOCAL_SRC_FILES := Advanced_Privacy-1.3.0-e-release.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_REQUIRED_MODULES := privapp-permissions-foundation.e.privacycentralapp.xml
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)

private_jni_libs := libgojni.so libmapbox-gl.so libtor.so
LOCAL_PREBUILT_JNI_LIBS_arm := $(foreach lib,$(private_jni_libs), @$(LIB_PATH)/$(lib))
LOCAL_PREBUILT_JNI_LIBS_arm64 := $(foreach lib,$(private_jni_libs), @$(LIB_PATH)/$(lib))
LOCAL_PREBUILT_JNI_LIBS_x86 := $(foreach lib,$(private_jni_libs), @$(LIB_PATH)/$(lib))
LOCAL_PREBUILT_JNI_LIBS_x86_64 := $(foreach lib,$(private_jni_libs), @$(LIB_PATH)/$(lib))

private_jni_copy_libs := libgojni.so libmapbox-gl.so libtor.so
LOCAL_POST_INSTALL_CMD := mkdir -p $(TARGET_OUT)/priv-app/$(LOCAL_MODULE)/lib/$(TARGET_ARCH)
LOCAL_POST_INSTALL_CMD += ; $(foreach lib,$(private_jni_copy_libs), cp $(LOCAL_PATH)/$(LIB_PATH)/$(lib) $(TARGET_OUT)/priv-app/$(LOCAL_MODULE)/lib/$(TARGET_ARCH)/$(LIB);)
include $(BUILD_PREBUILT)
