--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\LinkingIOS\\React-RCTLinking.podspec"	2020-01-30 13:55:47.922607700 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\LinkingIOS\\React-RCTLinking.podspec"	2020-01-29 14:10:08.922882400 -0800
@@ -25,11 +25,14 @@
   s.documentation_url      = "https://facebook.github.io/react-native/docs/linking"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
+  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
   s.source                 = source
   s.source_files           = "*.{h,m}"
   s.preserve_paths         = "package.json", "LICENSE", "LICENSE-docs"
   s.header_dir             = "React"
 
   s.dependency "React-Core", version
+
+  s.osx.exclude_files      = "RCTLinkingManager.m"
+  s.osx.source_files       = "macos/RCTLinkingManager.m"
 end
