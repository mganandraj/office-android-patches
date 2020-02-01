diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\third-party\\jsc\\Android.mk" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\third-party\\jsc\\Android.mk"
index 25462a6..60d3aa5 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\third-party\\jsc\\Android.mk"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\third-party\\jsc\\Android.mk"
@@ -3,4 +3,4 @@ include $(CLEAR_VARS)
 LOCAL_MODULE:= jsc
 LOCAL_SRC_FILES := jni/$(TARGET_ARCH_ABI)/libjsc.so
 LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
-include $(PREBUILT_SHARED_LIBRARY)
\ No newline at end of file
+include $(PREBUILT_SHARED_LIBRARY)
