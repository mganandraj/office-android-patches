--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Alert\\Alert.js"	2020-01-30 13:55:47.827578300 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Alert\\Alert.js"	2020-01-29 14:10:08.803916400 -0800
@@ -10,6 +10,7 @@
 
 'use strict';
 
+const AlertMacOS = require('AlertMacOS'); // TODO(macOS ISS#2323203)
 const NativeModules = require('../BatchedBridge/NativeModules');
 const RCTAlertManager = NativeModules.AlertManager;
 const Platform = require('../Utilities/Platform');
@@ -25,12 +26,12 @@
   onDismiss?: ?Function,
 };
 
-type AlertType = $Keys<{
+export type AlertType = $Keys<{
   default: string,
   'plain-text': string,
   'secure-text': string,
   'login-password': string,
-}>;
+}>; // added export TODO(macOS ISS#2323203)
 
 export type AlertButtonStyle = $Keys<{
   default: string,
@@ -52,6 +53,8 @@
   ): void {
     if (Platform.OS === 'ios') {
       Alert.prompt(title, message, buttons, 'default');
+    } else if (Platform.OS === 'macos' /* TODO[(macOS ISS#2323203) */) {
+      AlertMacOS.prompt(title, message, buttons); // TODO](macOS ISS#2323203)
     } else if (Platform.OS === 'android') {
       let config = {
         title: title || '',
