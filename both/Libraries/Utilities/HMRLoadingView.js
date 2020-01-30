diff --git a/E:/github/ms-react-native-forpatch/Libraries/Utilities/HMRLoadingView.js b/E:/github/fb-react-native-forpatch/Libraries/Utilities/HMRLoadingView.js
index 0fe67ae43..13eaa4bb8 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Utilities/HMRLoadingView.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Utilities/HMRLoadingView.js
@@ -8,24 +8,15 @@
  * @flow strict-local
  */
 
-// TODO(macOS ISS#2323203) TODO(windows ISS): this file is HMRLoadingView.ios.js in facebook's repo.  Renamed to HMRLoadingView.js since it is shared here between ios, macos, and windows.
-
 'use strict';
 
-const processColor = require('../StyleSheet/processColor');
-const {DevLoadingView} = require('../BatchedBridge/NativeModules');
-
 class HMRLoadingView {
   static showMessage(message: string) {
-    DevLoadingView.showMessage(
-      message,
-      processColor('#000000'),
-      processColor('#aaaaaa'),
-    );
+    // noop
   }
 
   static hide() {
-    DevLoadingView.hide();
+    // noop
   }
 }
 
