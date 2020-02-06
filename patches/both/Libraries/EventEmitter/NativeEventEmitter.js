--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\EventEmitter\\NativeEventEmitter.js"	2020-01-30 13:55:47.899606900 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\EventEmitter\\NativeEventEmitter.js"	2020-01-29 14:10:08.890882000 -0800
@@ -32,7 +32,10 @@
 
   constructor(nativeModule: ?NativeModule) {
     super(RCTDeviceEventEmitter.sharedSubscriber);
-    if (Platform.OS === 'ios') {
+    if (
+      Platform.OS === 'ios' ||
+      Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
+    ) {
       invariant(nativeModule, 'Native module cannot be null.');
       this._nativeModule = nativeModule;
     }
