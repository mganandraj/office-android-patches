diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\first-party\\fb\\Android.mk" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\first-party\\fb\\Android.mk"
index 90f2565..ba27a66 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\first-party\\fb\\Android.mk"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\first-party\\fb\\Android.mk"
@@ -21,6 +21,7 @@ LOCAL_SRC_FILES:= \
        jni/ReadableByteChannel.cpp \
        jni/References.cpp \
        jni/WeakReference.cpp \
+       CRTSafeAPIs.cpp \
        log.cpp \
        lyra/lyra.cpp \
        onload.cpp \
@@ -29,6 +30,7 @@ LOCAL_C_INCLUDES := $(LOCAL_PATH)/include
 LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include
 
 LOCAL_CFLAGS := -DLOG_TAG=\"libfb\" -DDISABLE_CPUCAP -DDISABLE_XPLAT -fexceptions -frtti
+
 # include/utils/threads.h has unused parameters
 LOCAL_CFLAGS += -Wno-unused-parameter
 ifeq ($(TOOLCHAIN_PERMISSIVE),true)
