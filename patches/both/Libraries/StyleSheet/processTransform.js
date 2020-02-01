diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\StyleSheet\\processTransform.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\StyleSheet\\processTransform.js"
index 353d3de..1ec9692 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\StyleSheet\\processTransform.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\StyleSheet\\processTransform.js"
@@ -34,7 +34,11 @@ function processTransform(
   // Android & iOS implementations of transform property accept the list of
   // transform properties as opposed to a transform Matrix. This is necessary
   // to control transform property updates completely on the native thread.
-  if (Platform.OS === 'android' || Platform.OS === 'ios') {
+  if (
+    Platform.OS === 'android' ||
+    Platform.OS === 'ios' ||
+    Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
+  ) {
     return transform;
   }
 
