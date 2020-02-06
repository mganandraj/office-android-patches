--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\NativeAnimation\\React-RCTAnimation.podspec"	2020-01-30 13:55:47.947607600 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\NativeAnimation\\React-RCTAnimation.podspec"	2020-01-29 14:10:08.944884700 -0800
@@ -24,7 +24,7 @@
   s.homepage               = "http://facebook.github.io/react-native/"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
+  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
   s.source                 = source
   s.source_files           = "{Drivers/*,Nodes/*,*}.{h,m}"
   s.preserve_paths         = "package.json", "LICENSE", "LICENSE-docs"
