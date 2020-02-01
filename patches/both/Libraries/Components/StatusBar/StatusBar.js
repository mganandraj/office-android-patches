diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\StatusBar\\StatusBar.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\StatusBar\\StatusBar.js"
index 7617f77..a9d1b52 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\StatusBar\\StatusBar.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\StatusBar\\StatusBar.js"
@@ -18,6 +18,8 @@ const processColor = require('../../StyleSheet/processColor');
 const StatusBarManager = require('../../BatchedBridge/NativeModules')
   .StatusBarManager;
 
+import type {ColorValue} from 'StyleSheetTypes'; // TODO(macOS ISS#2323203)
+
 /**
  * Status bar style
  */
@@ -29,11 +31,11 @@ export type StatusBarStyle = $Keys<{
   /**
    * Dark background, white texts and icons
    */
-  'light-content': string,
+  'light-content': ColorValue, // TODO(macOS ISS#2323203)
   /**
    * Light background, dark texts and icons
    */
-  'dark-content': string,
+  'dark-content': ColorValue, // TODO(macOS ISS#2323203)
 }>;
 
 /**
@@ -59,7 +61,7 @@ type AndroidProps = $ReadOnly<{|
    * The background color of the status bar.
    * @platform android
    */
-  backgroundColor?: ?string,
+  backgroundColor?: ?ColorValue, // TODO(macOS ISS#2323203)
   /**
    * If the status bar is translucent.
    * When translucent is set to true, the app will draw under the status bar.
