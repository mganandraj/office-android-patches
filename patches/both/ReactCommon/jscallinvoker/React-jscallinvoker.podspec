--- "E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\jscallinvoker\\React-jscallinvoker.podspec"	2020-01-30 13:55:48.604615800 -0800
+++ "E:\\github\\ms-react-native-forpatch\\ReactCommon\\jscallinvoker\\React-jscallinvoker.podspec"	2020-01-29 14:10:09.822923000 -0800
@@ -28,12 +28,12 @@
   s.homepage               = "http://facebook.github.io/react-native/"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
+  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
   s.source                 = source
   s.source_files         = "jsireact/*.{cpp,h}"
   s.compiler_flags         = folly_compiler_flags + ' ' + boost_compiler_flags
   s.header_dir             = "jsireact"
-  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/Folly\"" }
+  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/Folly\" \"$(PODS_ROOT)/DoubleConversion\"" }
 
   s.dependency "React-cxxreact", version
   s.dependency "Folly", folly_version
