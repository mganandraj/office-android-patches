diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Utilities\\HMRLoadingView.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Utilities\\HMRLoadingView.js"
index 13eaa4b..0fe67ae 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Utilities\\HMRLoadingView.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Utilities\\HMRLoadingView.js"
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
 
