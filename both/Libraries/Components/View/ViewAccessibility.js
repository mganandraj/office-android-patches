diff --git a/E:/github/ms-react-native-forpatch/Libraries/Components/View/ViewAccessibility.js b/E:/github/fb-react-native-forpatch/Libraries/Components/View/ViewAccessibility.js
index f54ef112a..ab23281ee 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Components/View/ViewAccessibility.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Components/View/ViewAccessibility.js
@@ -12,11 +12,6 @@
 
 import type {SyntheticEvent} from 'CoreEventTypes';
 
-// [TODO(android ISS)
-export type AccessibilityNodeInfoProp = {
-  clickable: boolean,
-}; // ]TODO(android ISS)
-
 // This must be kept in sync with the AccessibilityRolesMask in RCTViewManager.m
 export type AccessibilityRole =
   | 'none'
