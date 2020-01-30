diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/Android.mk b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/Android.mk
index 264e08cd3..7d410f44c 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/Android.mk
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/Android.mk
@@ -53,6 +53,7 @@ include $(BUILD_SHARED_LIBRARY)
 #   to the specification inside <dir>/<module-dir>/Android.mk.
 $(call import-module,folly)
 $(call import-module,fb)
+$(call import-module,jsc)
 $(call import-module,fbgloginit)
 $(call import-module,yogajni)
 $(call import-module,cxxreact)
@@ -65,4 +66,5 @@ include $(REACT_SRC_DIR)/turbomodule/core/jni/Android.mk
 # TODO(ramanpreet):
 #   Why doesn't this import-module call generate a jscexecutor.so file?
 # $(call import-module,jscexecutor)
-include $(REACT_SRC_DIR)/v8executor/Android.mk
\ No newline at end of file
+
+include $(REACT_SRC_DIR)/jscexecutor/Android.mk
