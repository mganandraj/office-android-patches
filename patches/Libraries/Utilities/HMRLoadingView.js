--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Utilities\\HMRLoadingView.js"	2020-01-30 13:55:48.006612500 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Utilities\\HMRLoadingView.js"	2020-01-29 14:10:09.008883700 -0800
@@ -8,15 +8,24 @@
  * @flow strict-local
  */
 
+// TODO(macOS ISS#2323203) TODO(windows ISS): this file is HMRLoadingView.ios.js in facebook's repo.  Renamed to HMRLoadingView.js since it is shared here between ios, macos, and windows.
+
 'use strict';
 
+const processColor = require('../StyleSheet/processColor');
+const {DevLoadingView} = require('../BatchedBridge/NativeModules');
+
 class HMRLoadingView {
   static showMessage(message: string) {
-    // noop
+    DevLoadingView.showMessage(
+      message,
+      processColor('#000000'),
+      processColor('#aaaaaa'),
+    );
   }
 
   static hide() {
-    // noop
+    DevLoadingView.hide();
   }
 }
 
