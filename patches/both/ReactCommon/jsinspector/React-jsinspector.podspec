--- "E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\jsinspector\\React-jsinspector.podspec"	2020-01-30 13:55:48.612617100 -0800
+++ "E:\\github\\ms-react-native-forpatch\\ReactCommon\\jsinspector\\React-jsinspector.podspec"	2020-01-29 14:10:09.832892000 -0800
@@ -24,7 +24,7 @@
   s.homepage               = "http://facebook.github.io/react-native/"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
+  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
   s.source                 = source
   s.source_files           = "*.{cpp,h}"
   s.header_dir             = 'jsinspector'
