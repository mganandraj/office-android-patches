--- "E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\jsi\\React-jsi.podspec"	2020-01-30 13:55:48.606614400 -0800
+++ "E:\\github\\ms-react-native-forpatch\\ReactCommon\\jsi\\React-jsi.podspec"	2020-01-29 14:10:09.825892100 -0800
@@ -28,14 +28,20 @@
   s.homepage               = "http://facebook.github.io/react-native/"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
+  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
   s.source                 = source
   s.source_files           = "**/*.{cpp,h}"
+  s.exclude_files          = "**/test/*"
   s.framework              = "JavaScriptCore"
   s.compiler_flags         = folly_compiler_flags + ' ' + boost_compiler_flags
-  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/Folly\"" }
+  s.pod_target_xcconfig    = { "HEADER_SEARCH_PATHS" => "\"$(PODS_ROOT)/boost-for-react-native\" \"$(PODS_ROOT)/Folly\" \"$(PODS_ROOT)/DoubleConversion\"" }
   s.header_dir             = "jsi"
   s.default_subspec        = "Default"
+# Microsoft CocoaPod Support [
+	s.exclude_files          = "*V8*", # Android uses V8 files for Chromium that Apple platforms should ignore
+														 "FileUtils.*", # Used by Android JSI
+													   "**/test/*"
+# ] Microsoft CocoaPod Support
 
   s.dependency "boost-for-react-native", "1.63.0"
   s.dependency "DoubleConversion"
