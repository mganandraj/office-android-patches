diff --git a/E:/github/ms-react-native-forpatch/Libraries/ReactNative/UIManager.js b/E:/github/fb-react-native-forpatch/Libraries/ReactNative/UIManager.js
index 756fab360..cf7f8edbd 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/ReactNative/UIManager.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/ReactNative/UIManager.js
@@ -46,8 +46,10 @@ UIManager.getViewManagerConfig = function(viewManagerName: string) {
 
   // If we're in the Chrome Debugger, let's not even try calling the sync
   // method.
-  if (!global.nativeCallSyncHook) {
-    return config;
+  if (__DEV__) {
+    if (!global.nativeCallSyncHook) {
+      return config;
+    }
   }
 
   if (UIManager.lazilyLoadView && !triedLoadingConfig.has(viewManagerName)) {
@@ -103,10 +105,7 @@ function lazifyViewManagerConfig(viewName) {
  * only needed for iOS, which puts the constants in the ViewManager
  * namespace instead of UIManager, unlike Android.
  */
-if (
-  Platform.OS === 'ios' ||
-  Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
-) {
+if (Platform.OS === 'ios') {
   Object.keys(UIManager).forEach(viewName => {
     lazifyViewManagerConfig(viewName);
   });
@@ -140,7 +139,7 @@ if (
   }
 }
 
-if (!global.nativeCallSyncHook) {
+if (__DEV__) {
   Object.keys(UIManager).forEach(viewManagerName => {
     if (!UIManagerProperties.includes(viewManagerName)) {
       if (!viewManagerConfigs[viewManagerName]) {
