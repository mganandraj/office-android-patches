diff --git a/E:/github/ms-react-native-forpatch/Libraries/Network/__tests__/XMLHttpRequest-test.js b/E:/github/fb-react-native-forpatch/Libraries/Network/__tests__/XMLHttpRequest-test.js
index bfe4be6aa..e69e91b55 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Network/__tests__/XMLHttpRequest-test.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Network/__tests__/XMLHttpRequest-test.js
@@ -14,10 +14,7 @@ const Platform = require('../../Utilities/Platform');
 let requestId = 1;
 
 function setRequestId(id) {
-  if (
-    Platform.OS === 'ios' ||
-    Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
-  ) {
+  if (Platform.OS === 'ios') {
     return;
   }
   requestId = id;
