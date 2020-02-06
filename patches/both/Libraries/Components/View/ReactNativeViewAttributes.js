--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\View\\ReactNativeViewAttributes.js"	2020-01-30 13:55:47.885608600 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\View\\ReactNativeViewAttributes.js"	2020-01-29 14:10:08.877882300 -0800
@@ -23,9 +23,12 @@
   accessibilityRole: true,
   accessibilityStates: true,
   accessibilityHint: true,
+  acceptsKeyboardFocus: true, // TODO(macOS ISS#2323203)
+  enableFocusRing: true, // TODO(macOS ISS#2323203)
   importantForAccessibility: true,
   nativeID: true,
   testID: true,
+  tabIndex: true, // TODO(win ISS#2323203)
   renderToHardwareTextureAndroid: true,
   shouldRasterizeIOS: true,
   onLayout: true,
@@ -35,6 +38,12 @@
   onAccessibilityEscape: true,
   collapsable: true,
   needsOffscreenAlphaCompositing: true,
+  onMouseEnter: true, // [TODO(macOS ISS#2323203)
+  onMouseLeave: true,
+  onDragEnter: true,
+  onDragLeave: true,
+  onDrop: true,
+  draggedTypes: true, // ]TODO(macOS ISS#2323203)
   style: ReactNativeStyleAttributes,
 };
 
