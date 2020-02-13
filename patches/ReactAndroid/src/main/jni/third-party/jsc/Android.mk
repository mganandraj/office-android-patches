--- "e:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\third-party\\jsc\\Android.mk"	2020-01-29 14:11:26.494528400 -0800
+++ "e:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\third-party\\jsc\\Android.mk"	2020-01-29 14:10:09.688894200 -0800
@@ -3,4 +3,4 @@
 LOCAL_MODULE:= jsc
 LOCAL_SRC_FILES := jni/$(TARGET_ARCH_ABI)/libjsc.so
 LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
-include $(PREBUILT_SHARED_LIBRARY)
\ No newline at end of file
+include $(PREBUILT_SHARED_LIBRARY)
