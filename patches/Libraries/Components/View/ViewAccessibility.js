--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\View\\ViewAccessibility.js"	2020-01-30 13:55:47.886607600 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Components\\View\\ViewAccessibility.js"	2020-01-29 14:10:08.878882100 -0800
@@ -12,6 +12,11 @@
 
 import type {SyntheticEvent} from 'CoreEventTypes';
 
+// [TODO(android ISS)
+export type AccessibilityNodeInfoProp = {
+  clickable: boolean,
+}; // ]TODO(android ISS)
+
 // This must be kept in sync with the AccessibilityRolesMask in RCTViewManager.m
 export type AccessibilityRole =
   | 'none'
