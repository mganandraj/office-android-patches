diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\nativeImageSource.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\nativeImageSource.js"
index 374a857..14b46b6 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\nativeImageSource.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\nativeImageSource.js"
@@ -23,6 +23,7 @@ export type NativeImageSource = {|
 type NativeImageSourceSpec = {|
   +android?: string,
   +ios?: string,
+  +macos?: string, // TODO(macOS ISS#2323203)
   +default?: string,
 
   // For more details on width and height, see
