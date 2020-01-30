diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/turbomodule/samples/React-turbomodule-samples.podspec b/E:/github/fb-react-native-forpatch/ReactCommon/turbomodule/samples/React-turbomodule-samples.podspec
index da4111a1a..e7cde973e 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/turbomodule/samples/React-turbomodule-samples.podspec
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/turbomodule/samples/React-turbomodule-samples.podspec
@@ -28,11 +28,11 @@ Pod::Spec.new do |s|
   s.homepage               = "http://facebook.github.io/react-native/"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
+  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
   s.source                 = source
   s.source_files           = "*.{cpp,h}"
   s.compiler_flags         = folly_compiler_flags + ' ' + boost_compiler_flags
-  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/Folly\" \"$(PODS_ROOT)/DoubleConversion\"" }
+  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/Folly\"" }
   s.header_dir             = "jsireact"
   s.xcconfig               = { "OTHER_CFLAGS" => "$(inherited) -DRN_TURBO_MODULE_ENABLED" }
 
