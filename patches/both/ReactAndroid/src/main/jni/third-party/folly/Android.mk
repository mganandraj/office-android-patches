diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\third-party\\folly\\Android.mk" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\third-party\\folly\\Android.mk"
index c84f2d9..67d4abd 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\third-party\\folly\\Android.mk"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\third-party\\folly\\Android.mk"
@@ -26,7 +26,7 @@ FOLLY_FLAGS := \
   -DFOLLY_NO_CONFIG=1 \
   -DFOLLY_HAVE_CLOCK_GETTIME=1 \
   -DFOLLY_HAVE_MEMRCHR=1 \
-  -DFOLLY_USE_LIBCPP=1
+#  -DFOLLY_USE_LIBCPP=1
 
 # If APP_PLATFORM in Application.mk targets android-23 above, please comment this line.
 # NDK uses GNU style stderror_r() after API 23.
@@ -94,4 +94,4 @@ include $(BUILD_SHARED_LIBRARY)
 
 $(call import-module,glog)
 $(call import-module,double-conversion)
-$(call import-module,boost)
+$(call import-module,boost)
\ No newline at end of file
