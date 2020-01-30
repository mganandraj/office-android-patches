diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/third-party/boost/Android.mk b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/third-party/boost/Android.mk
index a7822cd2b..089e7d84b 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/third-party/boost/Android.mk
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/third-party/boost/Android.mk
@@ -1,8 +1,8 @@
 LOCAL_PATH:= $(call my-dir)
 include $(CLEAR_VARS)
 
-LOCAL_C_INCLUDES := $(LOCAL_PATH)
-LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
+LOCAL_C_INCLUDES := $(LOCAL_PATH)/boost_1_63_0
+LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/boost_1_63_0
 
 LOCAL_MODULE    := boost
 
