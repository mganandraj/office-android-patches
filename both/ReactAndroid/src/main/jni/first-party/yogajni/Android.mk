diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/first-party/yogajni/Android.mk b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/first-party/yogajni/Android.mk
index 875efc06a..7fa2b376b 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/first-party/yogajni/Android.mk
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/first-party/yogajni/Android.mk
@@ -15,7 +15,7 @@ LOCAL_SRC_FILES := \
 
 LOCAL_C_INCLUDES := $(LOCAL_PATH)/jni
 
-LOCAL_CFLAGS += -fvisibility=hidden -frtti -fexceptions -O3
+LOCAL_CFLAGS += -fvisibility=hidden -fexceptions -frtti -O3
 
 LOCAL_LDLIBS += -landroid -llog
 LOCAL_STATIC_LIBRARIES := libyogacore
