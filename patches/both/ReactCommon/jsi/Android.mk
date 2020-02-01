diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\jsi\\Android.mk" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\jsi\\Android.mk"
index d6a547c..cb29389 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\jsi\\Android.mk"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\jsi\\Android.mk"
@@ -10,7 +10,6 @@ include $(CLEAR_VARS)
 LOCAL_MODULE := jsi
 
 LOCAL_SRC_FILES := $(wildcard $(LOCAL_PATH)/jsi/*.cpp)
-
 LOCAL_C_INCLUDES := $(LOCAL_PATH)
 LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
 
@@ -19,17 +18,24 @@ LOCAL_SHARED_LIBRARIES := libfolly_json glog
 
 include $(BUILD_STATIC_LIBRARY)
 
-
 include $(CLEAR_VARS)
 
-LOCAL_MODULE := jscruntime
+LOCAL_SRC_FILES := \
+    FileUtils.cpp \
+    V8Runtime_shared.cpp \
+    V8Runtime_basic.cpp \
+    V8Runtime_droid.cpp \
+    V8Platform.cpp \
 
-LOCAL_SRC_FILES := $(wildcard $(LOCAL_PATH)/*.cpp)
+LOCAL_MODULE := v8runtime
+LOCAL_SHARED_LIBRARIES := libfolly_json glog libv8 libv8platform libv8base
 
-LOCAL_C_INCLUDES := $(LOCAL_PATH)
+LOCAL_C_INCLUDES := $(LOCAL_PATH) $(LOCAL_PATH)/..
 LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
 
 LOCAL_CFLAGS := -fexceptions -frtti -O3
-LOCAL_SHARED_LIBRARIES := libfolly_json libjsc glog
-
 include $(BUILD_STATIC_LIBRARY)
+
+$(call import-module,v8base)
+$(call import-module,v8)
+$(call import-module,v8platform)
