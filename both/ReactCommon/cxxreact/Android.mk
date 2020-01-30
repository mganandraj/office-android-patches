diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/Android.mk b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/Android.mk
index e72045c45..e0bee78c3 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/Android.mk
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/Android.mk
@@ -26,6 +26,7 @@ include $(BUILD_STATIC_LIBRARY)
 
 $(call import-module,fb)
 $(call import-module,folly)
+$(call import-module,jsc)
 $(call import-module,glog)
 $(call import-module,jsi)
-$(call import-module,jsinspector)
\ No newline at end of file
+$(call import-module,jsinspector)
