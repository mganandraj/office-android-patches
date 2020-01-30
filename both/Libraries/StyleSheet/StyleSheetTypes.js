diff --git a/E:/github/ms-react-native-forpatch/Libraries/StyleSheet/StyleSheetTypes.js b/E:/github/fb-react-native-forpatch/Libraries/StyleSheet/StyleSheetTypes.js
index bec6a2320..f307de6f0 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/StyleSheet/StyleSheetTypes.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/StyleSheet/StyleSheetTypes.js
@@ -11,9 +11,8 @@
 'use strict';
 
 const AnimatedNode = require('../Animated/src/nodes/AnimatedNode');
-import type {NativeOrDynamicColorType} from '../Color/NativeOrDynamicColorType'; // TODO(macOS ISS#2323203)
 
-export type ColorValue = null | string | NativeOrDynamicColorType; // TODO(macOS ISS#2323203)
+export type ColorValue = null | string;
 export type DimensionValue = null | number | string | AnimatedNode;
 
 /**
