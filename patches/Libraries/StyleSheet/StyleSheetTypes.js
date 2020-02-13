--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\StyleSheet\\StyleSheetTypes.js"	2020-01-30 13:55:47.978611500 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\StyleSheet\\StyleSheetTypes.js"	2020-01-29 14:10:08.981883200 -0800
@@ -11,8 +11,9 @@
 'use strict';
 
 const AnimatedNode = require('../Animated/src/nodes/AnimatedNode');
+import type {NativeOrDynamicColorType} from '../Color/NativeOrDynamicColorType'; // TODO(macOS ISS#2323203)
 
-export type ColorValue = null | string;
+export type ColorValue = null | string | NativeOrDynamicColorType; // TODO(macOS ISS#2323203)
 export type DimensionValue = null | number | string | AnimatedNode;
 
 /**
