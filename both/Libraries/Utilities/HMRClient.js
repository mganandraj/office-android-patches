diff --git a/E:/github/ms-react-native-forpatch/Libraries/Utilities/HMRClient.js b/E:/github/fb-react-native-forpatch/Libraries/Utilities/HMRClient.js
index 050c509c3..0c192a709 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Utilities/HMRClient.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Utilities/HMRClient.js
@@ -25,7 +25,6 @@ const HMRClient = {
     invariant(host, 'Missing required paramenter `host`');
 
     // Moving to top gives errors due to NativeModules not being initialized
-    // $FlowFixMe
     const HMRLoadingView = require('./HMRLoadingView');
 
     /* $FlowFixMe(>=0.84.0 site=react_native_fb) This comment suppresses an
@@ -49,10 +48,7 @@ const HMRClient = {
 Try the following to fix the issue:
 - Ensure that the packager server is running and available on the same network`;
 
-      if (
-        Platform.OS === 'ios' ||
-        Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
-      ) {
+      if (Platform.OS === 'ios') {
         error += `
 - Ensure that the Packager server URL is correctly set in AppDelegate`;
       } else {
