LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := BlissLauncher3
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_SYSTEM_EXT_MODULE := true
LOCAL_CERTIFICATE := platform
LOCAL_OPTIONAL_USES_LIBRARIES := androidx.window.extensions androidx.window.sidecar

ifeq ($(PLATFORM_SDK_VERSION), 32)
  LOCAL_SRC_FILES := BlissLauncher-apiS-release.apk
else
  LOCAL_SRC_FILES := BlissLauncher-apiT-release.apk
endif

LOCAL_OVERRIDES_PACKAGES := Home Launcher2 Launcher3 Launcher3QuickStep Trebuchet TrebuchetQuickStep Blisslauncher
LOCAL_REQUIRED_MODULES := privapp_whitelist_foundation.e.blisslauncher3.xml
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := privapp_whitelist_foundation.e.blisslauncher3.xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(TARGET_OUT_SYSTEM_EXT_ETC)/permissions
LOCAL_SYSTEM_EXT_MODULE := true
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)
