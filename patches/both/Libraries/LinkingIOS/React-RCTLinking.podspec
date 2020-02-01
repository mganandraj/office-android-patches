diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\LinkingIOS\\React-RCTLinking.podspec" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\LinkingIOS\\React-RCTLinking.podspec"
index e111a64..bfb7fcd 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\LinkingIOS\\React-RCTLinking.podspec"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\LinkingIOS\\React-RCTLinking.podspec"
@@ -25,11 +25,14 @@ Pod::Spec.new do |s|
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
