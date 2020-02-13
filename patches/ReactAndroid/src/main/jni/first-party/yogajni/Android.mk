--- "e:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\first-party\\yogajni\\Android.mk"	2020-01-30 13:55:48.474607200 -0800
+++ "e:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\first-party\\yogajni\\Android.mk"	2020-01-29 14:10:09.673890900 -0800
@@ -15,7 +15,7 @@
 
 LOCAL_C_INCLUDES := $(LOCAL_PATH)/jni
 
-LOCAL_CFLAGS += -fvisibility=hidden -fexceptions -frtti -O3
+LOCAL_CFLAGS += -fvisibility=hidden -frtti -fexceptions -O3
 
 LOCAL_LDLIBS += -landroid -llog
 LOCAL_STATIC_LIBRARIES := libyogacore
