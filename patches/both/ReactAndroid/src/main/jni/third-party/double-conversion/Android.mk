diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\third-party\\double-conversion\\Android.mk" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\third-party\\double-conversion\\Android.mk"
index 64f7e67..64650ff 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\third-party\\double-conversion\\Android.mk"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\third-party\\double-conversion\\Android.mk"
@@ -16,7 +16,7 @@ LOCAL_SRC_FILES := \
 
 LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)
 
-CXX11_FLAGS := -Wno-unused-variable -Wno-unused-local-typedefs
+CXX11_FLAGS := -Wno-unused-variable -Wno-unused-local-typedefs -Wno-unneeded-internal-declaration
 LOCAL_CFLAGS += $(CXX11_FLAGS)
 
 include $(BUILD_STATIC_LIBRARY)
