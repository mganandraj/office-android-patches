diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Animated\\src\\nodes\\AnimatedInterpolation.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Animated\\src\\nodes\\AnimatedInterpolation.js"
index d4df33a..29b7791 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Animated\\src\\nodes\\AnimatedInterpolation.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Animated\\src\\nodes\\AnimatedInterpolation.js"
@@ -167,7 +167,10 @@ function interpolate(
 
 function colorToRgba(input: string): string {
   let int32Color = normalizeColor(input);
-  if (int32Color === null) {
+  if (
+    int32Color === null ||
+    typeof int32Color !== 'number' /* TODO(macOS ISS#2323203) */
+  ) {
     return input;
   }
 
