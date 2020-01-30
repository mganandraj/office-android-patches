diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/React-cxxreact.podspec b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/React-cxxreact.podspec
index 5a9370f4d..961392974 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/React-cxxreact.podspec
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/React-cxxreact.podspec
@@ -28,16 +28,12 @@ Pod::Spec.new do |s|
   s.homepage               = "http://facebook.github.io/react-native/"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
+  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
   s.source                 = source
   s.source_files           = "*.{cpp,h}"
-  s.exclude_files          = "SampleCxxModule.*",
-  # Microsoft CocoaPod Support [
-														 "*V8*", # Android uses V8 files for Chromium that Apple platforms should ignore
-														 "File.*"
-# ] Microsoft CocoaPod Support
+  s.exclude_files          = "SampleCxxModule.*"
   s.compiler_flags         = folly_compiler_flags + ' ' + boost_compiler_flags
-  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/Folly\" \"$(PODS_ROOT)/DoubleConversion\"" }
+  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/Folly\"" }
   s.header_dir             = "cxxreact"
 
   s.dependency "boost-for-react-native", "1.63.0"
