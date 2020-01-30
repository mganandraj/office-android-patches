diff --git a/E:/github/ms-react-native-forpatch/Libraries/Alert/Alert.js b/E:/github/fb-react-native-forpatch/Libraries/Alert/Alert.js
index 6d91d6901..9d64acda4 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Alert/Alert.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Alert/Alert.js
@@ -10,7 +10,6 @@
 
 'use strict';
 
-const AlertMacOS = require('AlertMacOS'); // TODO(macOS ISS#2323203)
 const NativeModules = require('../BatchedBridge/NativeModules');
 const RCTAlertManager = NativeModules.AlertManager;
 const Platform = require('../Utilities/Platform');
@@ -26,12 +25,12 @@ type Options = {
   onDismiss?: ?Function,
 };
 
-export type AlertType = $Keys<{
+type AlertType = $Keys<{
   default: string,
   'plain-text': string,
   'secure-text': string,
   'login-password': string,
-}>; // added export TODO(macOS ISS#2323203)
+}>;
 
 export type AlertButtonStyle = $Keys<{
   default: string,
@@ -53,8 +52,6 @@ class Alert {
   ): void {
     if (Platform.OS === 'ios') {
       Alert.prompt(title, message, buttons, 'default');
-    } else if (Platform.OS === 'macos' /* TODO[(macOS ISS#2323203) */) {
-      AlertMacOS.prompt(title, message, buttons); // TODO](macOS ISS#2323203)
     } else if (Platform.OS === 'android') {
       let config = {
         title: title || '',
