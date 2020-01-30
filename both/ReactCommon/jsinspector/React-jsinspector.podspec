diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/jsinspector/React-jsinspector.podspec b/E:/github/fb-react-native-forpatch/ReactCommon/jsinspector/React-jsinspector.podspec
index 8f7cebf00..63db57a49 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/jsinspector/React-jsinspector.podspec
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/jsinspector/React-jsinspector.podspec
@@ -24,7 +24,7 @@ Pod::Spec.new do |s|
   s.homepage               = "http://facebook.github.io/react-native/"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
+  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
   s.source                 = source
   s.source_files           = "*.{cpp,h}"
   s.header_dir             = 'jsinspector'
