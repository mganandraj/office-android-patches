diff --git a/E:/github/ms-react-native-forpatch/Libraries/ActionSheetIOS/React-RCTActionSheet.podspec b/E:/github/fb-react-native-forpatch/Libraries/ActionSheetIOS/React-RCTActionSheet.podspec
index aff1f81e6..9cc25ab1e 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/ActionSheetIOS/React-RCTActionSheet.podspec
+++ b/E:/github/fb-react-native-forpatch/Libraries/ActionSheetIOS/React-RCTActionSheet.podspec
@@ -25,7 +25,7 @@ Pod::Spec.new do |s|
   s.documentation_url      = "https://facebook.github.io/react-native/docs/actionsheetios"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
+  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
   s.source                 = source
   s.source_files           = "*.{h,m}"
   s.preserve_paths          = "package.json", "LICENSE", "LICENSE-docs"
