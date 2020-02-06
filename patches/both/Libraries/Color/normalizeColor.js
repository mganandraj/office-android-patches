--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Color\\normalizeColor.js"	2020-01-30 13:55:47.853609700 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Color\\normalizeColor.js"	2020-01-29 14:10:08.827881400 -0800
@@ -11,7 +11,15 @@
 /* eslint no-bitwise: 0 */
 'use strict';
 
-function normalizeColor(color: string | number): ?number {
+import type {NativeOrDynamicColorType} from './NativeOrDynamicColorType'; // TODO(macOS ISS#2323203)
+
+function normalizeColor(
+  color: ?(
+    | string
+    | number
+    | NativeOrDynamicColorType
+  ) /* TODO(macOS ISS#2323203) */,
+): ?(number | NativeOrDynamicColorType) /* TODO(macOS ISS#2323203) */ {
   const matchers = getMatchers();
   let match;
 
@@ -22,6 +30,21 @@
     return null;
   }
 
+  // [TODO(macOS ISS#2323203)
+  if (typeof color === 'object' && color !== null) {
+    const normalizeColorObject = require('normalizeColorObject'); // TODO(macOS ISS#2323203)
+
+    const normalizedColorObj = normalizeColorObject(color);
+
+    if (normalizedColorObj !== null) {
+      return color;
+    }
+  }
+
+  if (typeof color !== 'string') {
+    return null;
+  } // ]TODO(macOS ISS#2323203)
+
   // Ordered based on occurrences on Facebook codebase
   if ((match = matchers.hex6.exec(color))) {
     return parseInt(match[1] + 'ff', 16) >>> 0;
