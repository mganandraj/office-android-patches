diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Network\\__tests__\\XMLHttpRequest-test.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Network\\__tests__\\XMLHttpRequest-test.js"
index e69e91b..bfe4be6 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Network\\__tests__\\XMLHttpRequest-test.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Network\\__tests__\\XMLHttpRequest-test.js"
@@ -14,7 +14,10 @@ const Platform = require('../../Utilities/Platform');
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
