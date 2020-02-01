diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\Application.mk" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\Application.mk"
index 017ddd7..5e5b929 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\Application.mk"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\Application.mk"
@@ -22,7 +22,7 @@ APP_MK_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
 # Where are APP_MK_DIR, THIRD_PARTY_NDK_DIR, etc. defined?
 #   The directories inside NDK_MODULE_PATH (ex: APP_MK_DIR, THIRD_PARTY_NDK_DIR,
 #   etc.) are defined inside build.gradle.
-NDK_MODULE_PATH := $(APP_MK_DIR)$(HOST_DIRSEP)$(THIRD_PARTY_NDK_DIR)$(HOST_DIRSEP)$(REACT_COMMON_DIR)$(HOST_DIRSEP)$(APP_MK_DIR)first-party$(HOST_DIRSEP)$(REACT_SRC_DIR)
+NDK_MODULE_PATH := $(APP_MK_DIR)$(HOST_DIRSEP)$(THIRD_PARTY_NDK_DIR)$(HOST_DIRSEP)$(REACT_COMMON_DIR)$(HOST_DIRSEP)$(APP_MK_DIR)first-party$(HOST_DIRSEP)$(THIRD_PARTY_NDK_SRC_DIR)$(HOST_DIRSEP)
 
 APP_STL := c++_shared
 
@@ -32,3 +32,5 @@ APP_CPPFLAGS := -std=c++1y
 APP_LDFLAGS := -Wl,--build-id
 
 NDK_TOOLCHAIN_VERSION := clang
+
+APP_ALLOW_MISSING_DEPS := true
\ No newline at end of file
