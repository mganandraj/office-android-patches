--- "e:\\github\\fb-react-native-forpatch-base\\ReactCommon\\jsiexecutor\\React-jsiexecutor.podspec"	2020-01-30 13:55:48.610616000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\ReactCommon\\jsiexecutor\\React-jsiexecutor.podspec"	2020-01-29 14:10:09.830892800 -0800
@@ -28,11 +28,11 @@
   s.homepage               = "http://facebook.github.io/react-native/"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
+  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
   s.source                 = source
   s.source_files         = "jsireact/*.{cpp,h}"
   s.compiler_flags         = folly_compiler_flags + ' ' + boost_compiler_flags
-  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/Folly\"" }
+  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/Folly\" \"$(PODS_ROOT)/DoubleConversion\"" }
   s.header_dir             = "jsireact"
 
   s.dependency "React-cxxreact", version
