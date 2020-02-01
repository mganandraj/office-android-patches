diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\ReactNative\\getNativeComponentAttributes.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\ReactNative\\getNativeComponentAttributes.js"
index bf08c38..3be8755 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\ReactNative\\getNativeComponentAttributes.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\ReactNative\\getNativeComponentAttributes.js"
@@ -21,6 +21,7 @@ const resolveAssetSource = require('../Image/resolveAssetSource');
 const sizesDiffer = require('../Utilities/differ/sizesDiffer');
 const invariant = require('invariant');
 const warning = require('fbjs/lib/warning');
+import type {NativeOrDynamicColorType} from 'NativeOrDynamicColorType'; // TODO(macOS ISS#2323203)
 
 function getNativeComponentAttributes(uiViewClassName: string) {
   const viewConfig = UIManager.getViewManagerConfig(uiViewClassName);
@@ -181,7 +182,10 @@ function getProcessorForType(typeName: string): ?(nextProp: any) => any {
   return null;
 }
 
-function processColorArray(colors: ?Array<any>): ?Array<?number> {
+function processColorArray(
+  colors: ?Array<any>,
+): ?Array<?(number | NativeOrDynamicColorType)> /* TODO(macOS ISS#2323203) */ {
+  // ]TODO(macOS ISS#2323203)
   return colors == null ? null : colors.map(processColor);
 }
 
