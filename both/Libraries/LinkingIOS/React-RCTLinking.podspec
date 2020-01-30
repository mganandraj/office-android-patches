diff --git a/E:/github/ms-react-native-forpatch/Libraries/LinkingIOS/React-RCTLinking.podspec b/E:/github/fb-react-native-forpatch/Libraries/LinkingIOS/React-RCTLinking.podspec
index bfb7fcd4b..e111a64a2 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/LinkingIOS/React-RCTLinking.podspec
+++ b/E:/github/fb-react-native-forpatch/Libraries/LinkingIOS/React-RCTLinking.podspec
@@ -25,14 +25,11 @@ Pod::Spec.new do |s|
   s.documentation_url      = "https://facebook.github.io/react-native/docs/linking"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
+  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
   s.source                 = source
   s.source_files           = "*.{h,m}"
   s.preserve_paths         = "package.json", "LICENSE", "LICENSE-docs"
   s.header_dir             = "React"
 
   s.dependency "React-Core", version
-
-  s.osx.exclude_files      = "RCTLinkingManager.m"
-  s.osx.source_files       = "macos/RCTLinkingManager.m"
 end
