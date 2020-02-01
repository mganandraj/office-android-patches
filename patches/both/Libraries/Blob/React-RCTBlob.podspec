diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Blob\\React-RCTBlob.podspec" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Blob\\React-RCTBlob.podspec"
index 55ab585..2f16973 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Blob\\React-RCTBlob.podspec"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Blob\\React-RCTBlob.podspec"
@@ -24,7 +24,7 @@ Pod::Spec.new do |s|
   s.homepage               = "http://facebook.github.io/react-native/"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
+  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
   s.source                 = source
   s.source_files           = "*.{h,m,mm}"
   s.preserve_paths         = "package.json", "LICENSE", "LICENSE-docs"
