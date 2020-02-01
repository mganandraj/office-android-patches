diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\React-cxxreact.podspec" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\React-cxxreact.podspec"
index 9613929..5a9370f 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\React-cxxreact.podspec"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\React-cxxreact.podspec"
@@ -28,12 +28,16 @@ Pod::Spec.new do |s|
   s.homepage               = "http://facebook.github.io/react-native/"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
+  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
   s.source                 = source
   s.source_files           = "*.{cpp,h}"
-  s.exclude_files          = "SampleCxxModule.*"
+  s.exclude_files          = "SampleCxxModule.*",
+  # Microsoft CocoaPod Support [
+														 "*V8*", # Android uses V8 files for Chromium that Apple platforms should ignore
+														 "File.*"
+# ] Microsoft CocoaPod Support
   s.compiler_flags         = folly_compiler_flags + ' ' + boost_compiler_flags
-  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/Folly\"" }
+  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/Folly\" \"$(PODS_ROOT)/DoubleConversion\"" }
   s.header_dir             = "cxxreact"
 
   s.dependency "boost-for-react-native", "1.63.0"
