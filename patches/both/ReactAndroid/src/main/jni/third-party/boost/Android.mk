diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\third-party\\boost\\Android.mk" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\third-party\\boost\\Android.mk"
index 089e7d8..a7822cd 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\third-party\\boost\\Android.mk"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\third-party\\boost\\Android.mk"
@@ -1,8 +1,8 @@
 LOCAL_PATH:= $(call my-dir)
 include $(CLEAR_VARS)
 
-LOCAL_C_INCLUDES := $(LOCAL_PATH)/boost_1_63_0
-LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/boost_1_63_0
+LOCAL_C_INCLUDES := $(LOCAL_PATH)
+LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
 
 LOCAL_MODULE    := boost
 
