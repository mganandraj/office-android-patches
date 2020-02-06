--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Network\\__tests__\\XMLHttpRequest-test.js"	2020-01-30 13:55:47.954608000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Network\\__tests__\\XMLHttpRequest-test.js"	2020-01-29 14:10:08.948916500 -0800
@@ -14,7 +14,10 @@
 let requestId = 1;
 
 function setRequestId(id) {
-  if (Platform.OS === 'ios') {
+  if (
+    Platform.OS === 'ios' ||
+    Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
+  ) {
     return;
   }
   requestId = id;
