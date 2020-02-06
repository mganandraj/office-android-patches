--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\PushNotificationIOS\\PushNotificationIOS.js"	2020-01-30 13:55:47.958612300 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\PushNotificationIOS\\PushNotificationIOS.js"	2020-01-29 14:10:08.952887100 -0800
@@ -11,6 +11,7 @@
 'use strict';
 
 const NativeEventEmitter = require('../EventEmitter/NativeEventEmitter');
+const Platform = require('../Utilities/Platform'); // TODO(macOS ISS#2323203)
 const RCTPushNotificationManager = require('../BatchedBridge/NativeModules')
   .PushNotificationManager;
 const invariant = require('invariant');
@@ -368,7 +369,8 @@
     if (
       !this._isRemote ||
       !this._notificationId ||
-      this._remoteNotificationCompleteCallbackCalled
+      this._remoteNotificationCompleteCallbackCalled ||
+      Platform.OS === 'macos' // TODO(macOS ISS#2323203)
     ) {
       return;
     }
