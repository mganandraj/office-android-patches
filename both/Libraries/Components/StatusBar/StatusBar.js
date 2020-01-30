diff --git a/E:/github/ms-react-native-forpatch/Libraries/Components/StatusBar/StatusBar.js b/E:/github/fb-react-native-forpatch/Libraries/Components/StatusBar/StatusBar.js
index a9d1b5232..7617f77db 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Components/StatusBar/StatusBar.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Components/StatusBar/StatusBar.js
@@ -18,8 +18,6 @@ const processColor = require('../../StyleSheet/processColor');
 const StatusBarManager = require('../../BatchedBridge/NativeModules')
   .StatusBarManager;
 
-import type {ColorValue} from 'StyleSheetTypes'; // TODO(macOS ISS#2323203)
-
 /**
  * Status bar style
  */
@@ -31,11 +29,11 @@ export type StatusBarStyle = $Keys<{
   /**
    * Dark background, white texts and icons
    */
-  'light-content': ColorValue, // TODO(macOS ISS#2323203)
+  'light-content': string,
   /**
    * Light background, dark texts and icons
    */
-  'dark-content': ColorValue, // TODO(macOS ISS#2323203)
+  'dark-content': string,
 }>;
 
 /**
@@ -61,7 +59,7 @@ type AndroidProps = $ReadOnly<{|
    * The background color of the status bar.
    * @platform android
    */
-  backgroundColor?: ?ColorValue, // TODO(macOS ISS#2323203)
+  backgroundColor?: ?string,
   /**
    * If the status bar is translucent.
    * When translucent is set to true, the app will draw under the status bar.
