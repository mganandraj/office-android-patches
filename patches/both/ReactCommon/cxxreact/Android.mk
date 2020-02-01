diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\Android.mk" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\Android.mk"
index e0bee78..e72045c 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\Android.mk"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\Android.mk"
@@ -26,7 +26,6 @@ include $(BUILD_STATIC_LIBRARY)
 
 $(call import-module,fb)
 $(call import-module,folly)
-$(call import-module,jsc)
 $(call import-module,glog)
 $(call import-module,jsi)
-$(call import-module,jsinspector)
+$(call import-module,jsinspector)
\ No newline at end of file
