diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\EventEmitter\\NativeEventEmitter.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\EventEmitter\\NativeEventEmitter.js"
index 6b70ef0..8ab3497 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\EventEmitter\\NativeEventEmitter.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\EventEmitter\\NativeEventEmitter.js"
@@ -32,7 +32,10 @@ class NativeEventEmitter extends EventEmitter {
 
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
