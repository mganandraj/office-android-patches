diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/jsiexecutor/React-jsiexecutor.podspec b/E:/github/fb-react-native-forpatch/ReactCommon/jsiexecutor/React-jsiexecutor.podspec
index 7854d1b17..d8c6f70fb 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/jsiexecutor/React-jsiexecutor.podspec
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/jsiexecutor/React-jsiexecutor.podspec
@@ -28,11 +28,11 @@ Pod::Spec.new do |s|
   s.homepage               = "http://facebook.github.io/react-native/"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
+  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
   s.source                 = source
   s.source_files         = "jsireact/*.{cpp,h}"
   s.compiler_flags         = folly_compiler_flags + ' ' + boost_compiler_flags
-  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/Folly\" \"$(PODS_ROOT)/DoubleConversion\"" }
+  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/Folly\"" }
   s.header_dir             = "jsireact"
 
   s.dependency "React-cxxreact", version
