--- "E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\third-party\\boost\\Android.mk"	2020-01-29 14:11:26.493527900 -0800
+++ "E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\third-party\\boost\\Android.mk"	2020-01-29 14:10:09.686920900 -0800
@@ -1,8 +1,8 @@
 LOCAL_PATH:= $(call my-dir)
 include $(CLEAR_VARS)
 
-LOCAL_C_INCLUDES := $(LOCAL_PATH)/boost_1_63_0
-LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/boost_1_63_0
+LOCAL_C_INCLUDES := $(LOCAL_PATH)
+LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
 
 LOCAL_MODULE    := boost
 
