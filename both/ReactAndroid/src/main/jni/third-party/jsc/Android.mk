diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/third-party/jsc/Android.mk b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/third-party/jsc/Android.mk
index 60d3aa531..25462a614 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/third-party/jsc/Android.mk
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/third-party/jsc/Android.mk
@@ -3,4 +3,4 @@ include $(CLEAR_VARS)
 LOCAL_MODULE:= jsc
 LOCAL_SRC_FILES := jni/$(TARGET_ARCH_ABI)/libjsc.so
 LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
-include $(PREBUILT_SHARED_LIBRARY)
+include $(PREBUILT_SHARED_LIBRARY)
\ No newline at end of file
