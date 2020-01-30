diff --git a/E:/github/ms-react-native-forpatch/Libraries/ReactNative/getNativeComponentAttributes.js b/E:/github/fb-react-native-forpatch/Libraries/ReactNative/getNativeComponentAttributes.js
index 3be875537..bf08c389e 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/ReactNative/getNativeComponentAttributes.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/ReactNative/getNativeComponentAttributes.js
@@ -21,7 +21,6 @@ const resolveAssetSource = require('../Image/resolveAssetSource');
 const sizesDiffer = require('../Utilities/differ/sizesDiffer');
 const invariant = require('invariant');
 const warning = require('fbjs/lib/warning');
-import type {NativeOrDynamicColorType} from 'NativeOrDynamicColorType'; // TODO(macOS ISS#2323203)
 
 function getNativeComponentAttributes(uiViewClassName: string) {
   const viewConfig = UIManager.getViewManagerConfig(uiViewClassName);
@@ -182,10 +181,7 @@ function getProcessorForType(typeName: string): ?(nextProp: any) => any {
   return null;
 }
 
-function processColorArray(
-  colors: ?Array<any>,
-): ?Array<?(number | NativeOrDynamicColorType)> /* TODO(macOS ISS#2323203) */ {
-  // ]TODO(macOS ISS#2323203)
+function processColorArray(colors: ?Array<any>): ?Array<?number> {
   return colors == null ? null : colors.map(processColor);
 }
 
