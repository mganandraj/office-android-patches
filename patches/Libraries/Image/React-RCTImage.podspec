--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\React-RCTImage.podspec"	2020-01-30 13:55:47.910611200 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Image\\React-RCTImage.podspec"	2020-01-29 14:10:08.904882100 -0800
@@ -25,7 +25,7 @@
   s.documentation_url      = "https://facebook.github.io/react-native/docs/image"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
+  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
   s.source                 = source
   s.source_files           = "*.{h,m}"
   s.preserve_paths         = "package.json", "LICENSE", "LICENSE-docs"
