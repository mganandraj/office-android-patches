diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\react\\jni\\Android.mk" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\react\\jni\\Android.mk"
index 7d410f4..264e08c 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\react\\jni\\Android.mk"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\react\\jni\\Android.mk"
@@ -53,7 +53,6 @@ include $(BUILD_SHARED_LIBRARY)
 #   to the specification inside <dir>/<module-dir>/Android.mk.
 $(call import-module,folly)
 $(call import-module,fb)
-$(call import-module,jsc)
 $(call import-module,fbgloginit)
 $(call import-module,yogajni)
 $(call import-module,cxxreact)
@@ -66,5 +65,4 @@ include $(REACT_SRC_DIR)/turbomodule/core/jni/Android.mk
 # TODO(ramanpreet):
 #   Why doesn't this import-module call generate a jscexecutor.so file?
 # $(call import-module,jscexecutor)
-
-include $(REACT_SRC_DIR)/jscexecutor/Android.mk
+include $(REACT_SRC_DIR)/v8executor/Android.mk
\ No newline at end of file
