diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/jsi/Android.mk b/E:/github/fb-react-native-forpatch/ReactCommon/jsi/Android.mk
index cb293890d..d6a547cc4 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/jsi/Android.mk
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/jsi/Android.mk
@@ -10,6 +10,7 @@ include $(CLEAR_VARS)
 LOCAL_MODULE := jsi
 
 LOCAL_SRC_FILES := $(wildcard $(LOCAL_PATH)/jsi/*.cpp)
+
 LOCAL_C_INCLUDES := $(LOCAL_PATH)
 LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
 
@@ -18,24 +19,17 @@ LOCAL_SHARED_LIBRARIES := libfolly_json glog
 
 include $(BUILD_STATIC_LIBRARY)
 
+
 include $(CLEAR_VARS)
 
-LOCAL_SRC_FILES := \
-    FileUtils.cpp \
-    V8Runtime_shared.cpp \
-    V8Runtime_basic.cpp \
-    V8Runtime_droid.cpp \
-    V8Platform.cpp \
+LOCAL_MODULE := jscruntime
 
-LOCAL_MODULE := v8runtime
-LOCAL_SHARED_LIBRARIES := libfolly_json glog libv8 libv8platform libv8base
+LOCAL_SRC_FILES := $(wildcard $(LOCAL_PATH)/*.cpp)
 
-LOCAL_C_INCLUDES := $(LOCAL_PATH) $(LOCAL_PATH)/..
+LOCAL_C_INCLUDES := $(LOCAL_PATH)
 LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
 
 LOCAL_CFLAGS := -fexceptions -frtti -O3
-include $(BUILD_STATIC_LIBRARY)
+LOCAL_SHARED_LIBRARIES := libfolly_json libjsc glog
 
-$(call import-module,v8base)
-$(call import-module,v8)
-$(call import-module,v8platform)
+include $(BUILD_STATIC_LIBRARY)
