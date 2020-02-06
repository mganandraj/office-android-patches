--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\StyleSheet\\processColor.js"	2020-01-30 13:55:47.979577500 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\StyleSheet\\processColor.js"	2020-01-29 14:10:08.983884700 -0800
@@ -13,9 +13,12 @@
 const Platform = require('../Utilities/Platform');
 
 const normalizeColor = require('../Color/normalizeColor');
+import type {NativeOrDynamicColorType} from '../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 /* eslint no-bitwise: 0 */
-function processColor(color?: ?(string | number)): ?number {
+function processColor(
+  color?: ?(string | number | NativeOrDynamicColorType),
+): ?(number | NativeOrDynamicColorType) /* TODO(macOS ISS#2323203) */ {
   if (color === undefined || color === null) {
     return color;
   }
@@ -25,6 +28,20 @@
     return undefined;
   }
 
+  if (typeof int32Color === 'object') {
+    const processColorObject = require('processColorObject'); // TODO(macOS ISS#2323203)
+
+    const processedColorObj = processColorObject(int32Color);
+
+    if (processedColorObj !== null) {
+      return processedColorObj;
+    }
+  }
+
+  if (typeof int32Color !== 'number') {
+    return null;
+  } // ]TODO(macOS ISS#2323203)
+
   // Converts 0xrrggbbaa into 0xaarrggbb
   int32Color = ((int32Color << 24) | (int32Color >>> 8)) >>> 0;
 
