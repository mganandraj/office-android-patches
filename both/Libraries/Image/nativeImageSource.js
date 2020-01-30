diff --git a/E:/github/ms-react-native-forpatch/Libraries/Image/nativeImageSource.js b/E:/github/fb-react-native-forpatch/Libraries/Image/nativeImageSource.js
index 14b46b6a3..374a857f2 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Image/nativeImageSource.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Image/nativeImageSource.js
@@ -23,7 +23,6 @@ export type NativeImageSource = {|
 type NativeImageSourceSpec = {|
   +android?: string,
   +ios?: string,
-  +macos?: string, // TODO(macOS ISS#2323203)
   +default?: string,
 
   // For more details on width and height, see
