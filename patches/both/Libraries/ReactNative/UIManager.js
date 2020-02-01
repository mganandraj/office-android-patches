diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\ReactNative\\UIManager.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\ReactNative\\UIManager.js"
index cf7f8ed..756fab3 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\ReactNative\\UIManager.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\ReactNative\\UIManager.js"
@@ -46,10 +46,8 @@ UIManager.getViewManagerConfig = function(viewManagerName: string) {
 
   // If we're in the Chrome Debugger, let's not even try calling the sync
   // method.
-  if (__DEV__) {
-    if (!global.nativeCallSyncHook) {
-      return config;
-    }
+  if (!global.nativeCallSyncHook) {
+    return config;
   }
 
   if (UIManager.lazilyLoadView && !triedLoadingConfig.has(viewManagerName)) {
@@ -105,7 +103,10 @@ function lazifyViewManagerConfig(viewName) {
  * only needed for iOS, which puts the constants in the ViewManager
  * namespace instead of UIManager, unlike Android.
  */
-if (Platform.OS === 'ios') {
+if (
+  Platform.OS === 'ios' ||
+  Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
+) {
   Object.keys(UIManager).forEach(viewName => {
     lazifyViewManagerConfig(viewName);
   });
@@ -139,7 +140,7 @@ if (Platform.OS === 'ios') {
   }
 }
 
-if (__DEV__) {
+if (!global.nativeCallSyncHook) {
   Object.keys(UIManager).forEach(viewManagerName => {
     if (!UIManagerProperties.includes(viewManagerName)) {
       if (!viewManagerConfigs[viewManagerName]) {
