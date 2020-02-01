diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\PushNotificationIOS\\PushNotificationIOS.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\PushNotificationIOS\\PushNotificationIOS.js"
index 5a8680e..bd3e39d 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\PushNotificationIOS\\PushNotificationIOS.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\PushNotificationIOS\\PushNotificationIOS.js"
@@ -11,6 +11,7 @@
 'use strict';
 
 const NativeEventEmitter = require('../EventEmitter/NativeEventEmitter');
+const Platform = require('../Utilities/Platform'); // TODO(macOS ISS#2323203)
 const RCTPushNotificationManager = require('../BatchedBridge/NativeModules')
   .PushNotificationManager;
 const invariant = require('invariant');
@@ -368,7 +369,8 @@ class PushNotificationIOS {
     if (
       !this._isRemote ||
       !this._notificationId ||
-      this._remoteNotificationCompleteCallbackCalled
+      this._remoteNotificationCompleteCallbackCalled ||
+      Platform.OS === 'macos' // TODO(macOS ISS#2323203)
     ) {
       return;
     }
