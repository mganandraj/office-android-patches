--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\StatusBar\\StatusBar.js"	2020-01-30 13:55:47.875609600 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Components\\StatusBar\\StatusBar.js"	2020-01-29 14:10:08.864912200 -0800
@@ -18,6 +18,8 @@
 const StatusBarManager = require('../../BatchedBridge/NativeModules')
   .StatusBarManager;
 
+import type {ColorValue} from 'StyleSheetTypes'; // TODO(macOS ISS#2323203)
+
 /**
  * Status bar style
  */
@@ -29,11 +31,11 @@
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
@@ -59,7 +61,7 @@
    * The background color of the status bar.
    * @platform android
    */
-  backgroundColor?: ?string,
+  backgroundColor?: ?ColorValue, // TODO(macOS ISS#2323203)
   /**
    * If the status bar is translucent.
    * When translucent is set to true, the app will draw under the status bar.
