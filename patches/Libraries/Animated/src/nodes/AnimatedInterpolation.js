--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Animated\\src\\nodes\\AnimatedInterpolation.js"	2020-01-30 13:55:47.836608200 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Animated\\src\\nodes\\AnimatedInterpolation.js"	2020-01-29 14:10:08.813880100 -0800
@@ -167,7 +167,10 @@
 
 function colorToRgba(input: string): string {
   let int32Color = normalizeColor(input);
-  if (int32Color === null) {
+  if (
+    int32Color === null ||
+    typeof int32Color !== 'number' /* TODO(macOS ISS#2323203) */
+  ) {
     return input;
   }
 
