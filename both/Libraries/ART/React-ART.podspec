diff --git a/E:/github/ms-react-native-forpatch/Libraries/ART/React-ART.podspec b/E:/github/fb-react-native-forpatch/Libraries/ART/React-ART.podspec
index 8cf20a6e1..c7bd0d259 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/ART/React-ART.podspec
+++ b/E:/github/fb-react-native-forpatch/Libraries/ART/React-ART.podspec
@@ -24,7 +24,7 @@ Pod::Spec.new do |s|
   s.homepage               = "http://facebook.github.io/react-native/"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
+  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
   s.source                 = source
   s.source_files           = "**/*.{h,m}"
   s.preserve_paths         = "package.json", "LICENSE", "LICENSE-docs"
