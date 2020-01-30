diff --git a/E:/github/ms-react-native-forpatch/Libraries/PushNotificationIOS/PushNotificationIOS.js b/E:/github/fb-react-native-forpatch/Libraries/PushNotificationIOS/PushNotificationIOS.js
index bd3e39db3..5a8680e53 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/PushNotificationIOS/PushNotificationIOS.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/PushNotificationIOS/PushNotificationIOS.js
@@ -11,7 +11,6 @@
 'use strict';
 
 const NativeEventEmitter = require('../EventEmitter/NativeEventEmitter');
-const Platform = require('../Utilities/Platform'); // TODO(macOS ISS#2323203)
 const RCTPushNotificationManager = require('../BatchedBridge/NativeModules')
   .PushNotificationManager;
 const invariant = require('invariant');
@@ -369,8 +368,7 @@ class PushNotificationIOS {
     if (
       !this._isRemote ||
       !this._notificationId ||
-      this._remoteNotificationCompleteCallbackCalled ||
-      Platform.OS === 'macos' // TODO(macOS ISS#2323203)
+      this._remoteNotificationCompleteCallbackCalled
     ) {
       return;
     }
