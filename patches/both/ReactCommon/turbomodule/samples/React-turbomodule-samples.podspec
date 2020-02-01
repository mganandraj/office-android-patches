diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\turbomodule\\samples\\React-turbomodule-samples.podspec" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\turbomodule\\samples\\React-turbomodule-samples.podspec"
index e7cde97..da4111a 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\turbomodule\\samples\\React-turbomodule-samples.podspec"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\turbomodule\\samples\\React-turbomodule-samples.podspec"
@@ -28,11 +28,11 @@ Pod::Spec.new do |s|
   s.homepage               = "http://facebook.github.io/react-native/"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
+  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
   s.source                 = source
   s.source_files           = "*.{cpp,h}"
   s.compiler_flags         = folly_compiler_flags + ' ' + boost_compiler_flags
-  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/Folly\"" }
+  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/Folly\" \"$(PODS_ROOT)/DoubleConversion\"" }
   s.header_dir             = "jsireact"
   s.xcconfig               = { "OTHER_CFLAGS" => "$(inherited) -DRN_TURBO_MODULE_ENABLED" }
 
