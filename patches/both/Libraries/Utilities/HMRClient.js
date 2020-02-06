--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Utilities\\HMRClient.js"	2020-01-30 13:55:48.005612300 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Utilities\\HMRClient.js"	2020-01-29 14:10:09.008883700 -0800
@@ -25,6 +25,7 @@
     invariant(host, 'Missing required paramenter `host`');
 
     // Moving to top gives errors due to NativeModules not being initialized
+    // $FlowFixMe
     const HMRLoadingView = require('./HMRLoadingView');
 
     /* $FlowFixMe(>=0.84.0 site=react_native_fb) This comment suppresses an
@@ -48,7 +49,10 @@
 Try the following to fix the issue:
 - Ensure that the packager server is running and available on the same network`;
 
-      if (Platform.OS === 'ios') {
+      if (
+        Platform.OS === 'ios' ||
+        Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
+      ) {
         error += `
 - Ensure that the Packager server URL is correctly set in AppDelegate`;
       } else {
