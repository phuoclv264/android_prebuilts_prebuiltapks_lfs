LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := privapp-permissions-com.google.android.gms.xml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/permissions
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := microg.xml
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES := microg.xml
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := GmsCore
LOCAL_SRC_FILES := play-services-core-mapbox-default-release-unsigned.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_CERTIFICATE := platform
LOCAL_OVERRIDES_PACKAGES := com.qualcomm.location
LOCAL_REQUIRED_MODULES := privapp-permissions-com.google.android.gms.xml
LOCAL_REQUIRED_MODULES += microg.xml
ifneq ($(call math_gt_or_eq, $(PLATFORM_SDK_VERSION), 31),)
LOCAL_USES_LIBRARIES := com.android.location.provider
LOCAL_OPTIONAL_USES_LIBRARIES := org.apache.http.legacy \
				 androidx.window.extensions \
                                 androidx.window.sidecar
endif
include $(BUILD_PREBUILT)
