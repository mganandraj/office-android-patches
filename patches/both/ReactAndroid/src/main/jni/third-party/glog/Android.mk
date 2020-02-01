diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\third-party\\glog\\Android.mk" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\third-party\\glog\\Android.mk"
index 33ea07c..559e1aa 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\third-party\\glog\\Android.mk"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\third-party\\glog\\Android.mk"
@@ -3,19 +3,21 @@ LOCAL_PATH:= $(call my-dir)
 include $(CLEAR_VARS)
 
 LOCAL_SRC_FILES := \
-  glog-0.3.5/src/demangle.cc \
-  glog-0.3.5/src/logging.cc \
-  glog-0.3.5/src/raw_logging.cc \
-  glog-0.3.5/src/signalhandler.cc \
-  glog-0.3.5/src/symbolize.cc \
-  glog-0.3.5/src/utilities.cc \
-  glog-0.3.5/src/vlog_is_on.cc
+  glog/src/demangle.cc \
+  glog/src/logging.cc \
+  glog/src/raw_logging.cc \
+  glog/src/signalhandler.cc \
+  glog/src/symbolize.cc \
+  glog/src/utilities.cc \
+  glog/src/vlog_is_on.cc
 
-LOCAL_C_INCLUDES += $(LOCAL_PATH) $(LOCAL_PATH)/.. $(LOCAL_PATH)/glog-0.3.5/src/
+LOCAL_C_INCLUDES += $(LOCAL_PATH) $(LOCAL_PATH)/.. $(LOCAL_PATH)/glog/src/
 
 LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/exported
 
 LOCAL_CFLAGS += \
+  -Wno-unused-variable \
+  -Wno-unused-function \
   -Wwrite-strings \
   -Woverloaded-virtual \
   -Wno-sign-compare \
