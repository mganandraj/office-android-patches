--- "e:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\first-party\\fb\\Android.mk"	2020-01-30 13:55:48.459617000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\first-party\\fb\\Android.mk"	2020-01-29 14:10:09.653915000 -0800
@@ -21,6 +21,7 @@
        jni/ReadableByteChannel.cpp \
        jni/References.cpp \
        jni/WeakReference.cpp \
+       CRTSafeAPIs.cpp \
        log.cpp \
        lyra/lyra.cpp \
        onload.cpp \
@@ -29,6 +30,7 @@
 LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/include
 
 LOCAL_CFLAGS := -DLOG_TAG=\"libfb\" -DDISABLE_CPUCAP -DDISABLE_XPLAT -fexceptions -frtti
+
 # include/utils/threads.h has unused parameters
 LOCAL_CFLAGS += -Wno-unused-parameter
 ifeq ($(TOOLCHAIN_PERMISSIVE),true)
