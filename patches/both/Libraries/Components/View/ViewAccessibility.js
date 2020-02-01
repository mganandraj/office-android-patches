diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\View\\ViewAccessibility.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\View\\ViewAccessibility.js"
index ab23281..f54ef11 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\View\\ViewAccessibility.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\View\\ViewAccessibility.js"
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
