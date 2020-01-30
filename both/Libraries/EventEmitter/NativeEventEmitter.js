diff --git a/E:/github/ms-react-native-forpatch/Libraries/EventEmitter/NativeEventEmitter.js b/E:/github/fb-react-native-forpatch/Libraries/EventEmitter/NativeEventEmitter.js
index 8ab3497ff..6b70ef03d 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/EventEmitter/NativeEventEmitter.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/EventEmitter/NativeEventEmitter.js
@@ -32,10 +32,7 @@ class NativeEventEmitter extends EventEmitter {
 
   constructor(nativeModule: ?NativeModule) {
     super(RCTDeviceEventEmitter.sharedSubscriber);
-    if (
-      Platform.OS === 'ios' ||
-      Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
-    ) {
+    if (Platform.OS === 'ios') {
       invariant(nativeModule, 'Native module cannot be null.');
       this._nativeModule = nativeModule;
     }
