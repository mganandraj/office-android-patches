diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Utilities\\HMRClient.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Utilities\\HMRClient.js"
index 0c192a7..050c509 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Utilities\\HMRClient.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Utilities\\HMRClient.js"
@@ -25,6 +25,7 @@ const HMRClient = {
     invariant(host, 'Missing required paramenter `host`');
 
     // Moving to top gives errors due to NativeModules not being initialized
+    // $FlowFixMe
     const HMRLoadingView = require('./HMRLoadingView');
 
     /* $FlowFixMe(>=0.84.0 site=react_native_fb) This comment suppresses an
@@ -48,7 +49,10 @@ const HMRClient = {
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
