diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\StyleSheet\\StyleSheetTypes.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\StyleSheet\\StyleSheetTypes.js"
index f307de6..bec6a23 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\StyleSheet\\StyleSheetTypes.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\StyleSheet\\StyleSheetTypes.js"
@@ -11,8 +11,9 @@
 'use strict';
 
 const AnimatedNode = require('../Animated/src/nodes/AnimatedNode');
+import type {NativeOrDynamicColorType} from '../Color/NativeOrDynamicColorType'; // TODO(macOS ISS#2323203)
 
-export type ColorValue = null | string;
+export type ColorValue = null | string | NativeOrDynamicColorType; // TODO(macOS ISS#2323203)
 export type DimensionValue = null | number | string | AnimatedNode;
 
 /**
