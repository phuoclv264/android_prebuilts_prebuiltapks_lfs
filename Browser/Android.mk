LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := Browser
LOCAL_MODULE_CLASS := APPS
LOCAL_PRODUCT_MODULE := true
LOCAL_MULTILIB := both
ifneq (,$(wildcard user-keys/platform.x509.pem))
LOCAL_CERTIFICATE := user-keys/platform
else
LOCAL_CERTIFICATE := platform
endif
LOCAL_MODULE_TARGET_ARCH := arm arm64 x86 x86_64
my_src_arch := $(call get-prebuilt-src-arch,$(LOCAL_MODULE_TARGET_ARCH))
LOCAL_REQUIRED_MODULES := \
        TrichromeLibrary
LOCAL_SRC_FILES := $(my_src_arch)/TrichromeChrome.apk
ifneq ($(call math_gt_or_eq, $(PLATFORM_SDK_VERSION), 31),)
LOCAL_OPTIONAL_USES_LIBRARIES := androidx.window.extensions
endif
LOCAL_OVERRIDES_PACKAGES := Jelly Browser2 QuickSearchBox
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := TrichromeLibrary
LOCAL_MODULE_CLASS := APPS
LOCAL_PRODUCT_MODULE := true
LOCAL_MULTILIB := both
ifneq (,$(wildcard user-keys/platform.x509.pem))
LOCAL_CERTIFICATE := user-keys/platform
else
LOCAL_CERTIFICATE := platform
endif
LOCAL_MODULE_TARGET_ARCH := arm arm64 x86 x86_64
my_src_arch := $(call get-prebuilt-src-arch,$(LOCAL_MODULE_TARGET_ARCH))
LOCAL_SRC_FILES := $(my_src_arch)/TrichromeLibrary.apk
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := BrowserWebView
LOCAL_MODULE_CLASS := APPS
LOCAL_PRODUCT_MODULE := true
LOCAL_MULTILIB := both
ifneq (,$(wildcard user-keys/platform.x509.pem))
LOCAL_CERTIFICATE := user-keys/platform
else
LOCAL_CERTIFICATE := platform
endif
LOCAL_REQUIRED_MODULES := \
        libwebviewchromium_loader \
        libwebviewchromium_plat_support
LOCAL_MODULE_TARGET_ARCH := arm arm64 x86 x86_64
my_src_arch := $(call get-prebuilt-src-arch,$(LOCAL_MODULE_TARGET_ARCH))
LOCAL_REQUIRED_MODULES += \
        TrichromeLibrary
LOCAL_SRC_FILES := $(my_src_arch)/TrichromeWebView.apk
ifneq ($(call math_gt_or_eq, $(PLATFORM_SDK_VERSION), 31),)
LOCAL_OPTIONAL_USES_LIBRARIES := androidx.window.extensions
endif
LOCAL_OVERRIDES_PACKAGES := webview
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)
