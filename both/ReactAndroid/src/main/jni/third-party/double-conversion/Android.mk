diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/third-party/double-conversion/Android.mk b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/third-party/double-conversion/Android.mk
index 64650ff9a..64f7e67e8 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/third-party/double-conversion/Android.mk
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/third-party/double-conversion/Android.mk
@@ -16,7 +16,7 @@ LOCAL_SRC_FILES := \
 
 LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
 
-CXX11_FLAGS := -Wno-unused-variable -Wno-unused-local-typedefs -Wno-unneeded-internal-declaration
+CXX11_FLAGS := -Wno-unused-variable -Wno-unused-local-typedefs
 LOCAL_CFLAGS += $(CXX11_FLAGS)
 
 include $(BUILD_STATIC_LIBRARY)
