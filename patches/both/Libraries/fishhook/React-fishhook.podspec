diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\fishhook\\React-fishhook.podspec" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\fishhook\\React-fishhook.podspec"
index e720220..bfc0cc6 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\fishhook\\React-fishhook.podspec"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\fishhook\\React-fishhook.podspec"
@@ -24,7 +24,7 @@ Pod::Spec.new do |s|
   s.homepage               = "http://facebook.github.io/react-native/"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
+  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
   s.source                 = source
   s.source_files           = "*.{c,h}"
   s.header_dir             = "fishhook"
