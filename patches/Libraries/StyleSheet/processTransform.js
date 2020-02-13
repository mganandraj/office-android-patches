--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\StyleSheet\\processTransform.js"	2020-01-30 13:55:47.980625500 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\StyleSheet\\processTransform.js"	2020-01-29 14:10:08.984883700 -0800
@@ -34,7 +34,11 @@
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
 
