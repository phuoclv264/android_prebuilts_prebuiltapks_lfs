LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := Browser
LOCAL_MODULE_CLASS := APPS
LOCAL_PRODUCT_MODULE := true
LOCAL_MULTILIB := both
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_TARGET_ARCH := arm arm64 x86 x86_64
my_src_arch := $(call get-prebuilt-src-arch,$(LOCAL_MODULE_TARGET_ARCH))
LOCAL_REQUIRED_MODULES := \
        TrichromeLibrary
LOCAL_SRC_FILES := $(my_src_arch)/TrichromeChrome.apk
LOCAL_OVERRIDES_PACKAGES := Jelly Browser2 QuickSearchBox
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := TrichromeLibrary
LOCAL_MODULE_CLASS := APPS
LOCAL_PRODUCT_MODULE := true
LOCAL_MULTILIB := both
LOCAL_CERTIFICATE := platform
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
LOCAL_CERTIFICATE := platform
LOCAL_REQUIRED_MODULES := \
        libwebviewchromium_loader \
        libwebviewchromium_plat_support
LOCAL_MODULE_TARGET_ARCH := arm arm64 x86 x86_64
my_src_arch := $(call get-prebuilt-src-arch,$(LOCAL_MODULE_TARGET_ARCH))
LOCAL_REQUIRED_MODULES += \
        TrichromeLibrary
LOCAL_SRC_FILES := $(my_src_arch)/TrichromeWebView.apk
LOCAL_OVERRIDES_PACKAGES := webview
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)
