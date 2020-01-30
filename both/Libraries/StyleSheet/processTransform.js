diff --git a/E:/github/ms-react-native-forpatch/Libraries/StyleSheet/processTransform.js b/E:/github/fb-react-native-forpatch/Libraries/StyleSheet/processTransform.js
index 1ec96929d..353d3de77 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/StyleSheet/processTransform.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/StyleSheet/processTransform.js
@@ -34,11 +34,7 @@ function processTransform(
   // Android & iOS implementations of transform property accept the list of
   // transform properties as opposed to a transform Matrix. This is necessary
   // to control transform property updates completely on the native thread.
-  if (
-    Platform.OS === 'android' ||
-    Platform.OS === 'ios' ||
-    Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
-  ) {
+  if (Platform.OS === 'android' || Platform.OS === 'ios') {
     return transform;
   }
 
