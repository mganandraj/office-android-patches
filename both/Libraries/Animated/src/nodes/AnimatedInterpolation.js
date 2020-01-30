diff --git a/E:/github/ms-react-native-forpatch/Libraries/Animated/src/nodes/AnimatedInterpolation.js b/E:/github/fb-react-native-forpatch/Libraries/Animated/src/nodes/AnimatedInterpolation.js
index 29b7791b3..d4df33a2f 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Animated/src/nodes/AnimatedInterpolation.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Animated/src/nodes/AnimatedInterpolation.js
@@ -167,10 +167,7 @@ function interpolate(
 
 function colorToRgba(input: string): string {
   let int32Color = normalizeColor(input);
-  if (
-    int32Color === null ||
-    typeof int32Color !== 'number' /* TODO(macOS ISS#2323203) */
-  ) {
+  if (int32Color === null) {
     return input;
   }
 
