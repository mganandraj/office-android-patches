diff --git a/E:/github/ms-react-native-forpatch/Libraries/StyleSheet/processColor.js b/E:/github/fb-react-native-forpatch/Libraries/StyleSheet/processColor.js
index c29c408d1..cfad1676f 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/StyleSheet/processColor.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/StyleSheet/processColor.js
@@ -13,12 +13,9 @@
 const Platform = require('../Utilities/Platform');
 
 const normalizeColor = require('../Color/normalizeColor');
-import type {NativeOrDynamicColorType} from '../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 /* eslint no-bitwise: 0 */
-function processColor(
-  color?: ?(string | number | NativeOrDynamicColorType),
-): ?(number | NativeOrDynamicColorType) /* TODO(macOS ISS#2323203) */ {
+function processColor(color?: ?(string | number)): ?number {
   if (color === undefined || color === null) {
     return color;
   }
@@ -28,20 +25,6 @@ function processColor(
     return undefined;
   }
 
-  if (typeof int32Color === 'object') {
-    const processColorObject = require('processColorObject'); // TODO(macOS ISS#2323203)
-
-    const processedColorObj = processColorObject(int32Color);
-
-    if (processedColorObj !== null) {
-      return processedColorObj;
-    }
-  }
-
-  if (typeof int32Color !== 'number') {
-    return null;
-  } // ]TODO(macOS ISS#2323203)
-
   // Converts 0xrrggbbaa into 0xaarrggbb
   int32Color = ((int32Color << 24) | (int32Color >>> 8)) >>> 0;
 
