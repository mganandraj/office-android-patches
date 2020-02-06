--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\ReactNative\\getNativeComponentAttributes.js"	2020-01-30 13:55:47.962609000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\ReactNative\\getNativeComponentAttributes.js"	2020-01-29 14:10:08.960883000 -0800
@@ -21,6 +21,7 @@
 const sizesDiffer = require('../Utilities/differ/sizesDiffer');
 const invariant = require('invariant');
 const warning = require('fbjs/lib/warning');
+import type {NativeOrDynamicColorType} from 'NativeOrDynamicColorType'; // TODO(macOS ISS#2323203)
 
 function getNativeComponentAttributes(uiViewClassName: string) {
   const viewConfig = UIManager.getViewManagerConfig(uiViewClassName);
@@ -181,7 +182,10 @@
   return null;
 }
 
-function processColorArray(colors: ?Array<any>): ?Array<?number> {
+function processColorArray(
+  colors: ?Array<any>,
+): ?Array<?(number | NativeOrDynamicColorType)> /* TODO(macOS ISS#2323203) */ {
+  // ]TODO(macOS ISS#2323203)
   return colors == null ? null : colors.map(processColor);
 }
 
