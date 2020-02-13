--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\nativeImageSource.js"	2020-01-30 13:55:47.912612600 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Image\\nativeImageSource.js"	2020-01-29 14:10:08.908884000 -0800
@@ -23,6 +23,7 @@
 type NativeImageSourceSpec = {|
   +android?: string,
   +ios?: string,
+  +macos?: string, // TODO(macOS ISS#2323203)
   +default?: string,
 
   // For more details on width and height, see
