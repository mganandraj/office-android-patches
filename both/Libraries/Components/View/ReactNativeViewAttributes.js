diff --git a/E:/github/ms-react-native-forpatch/Libraries/Components/View/ReactNativeViewAttributes.js b/E:/github/fb-react-native-forpatch/Libraries/Components/View/ReactNativeViewAttributes.js
index 4a060234d..b4a3b6904 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Components/View/ReactNativeViewAttributes.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Components/View/ReactNativeViewAttributes.js
@@ -23,12 +23,9 @@ ReactNativeViewAttributes.UIView = {
   accessibilityRole: true,
   accessibilityStates: true,
   accessibilityHint: true,
-  acceptsKeyboardFocus: true, // TODO(macOS ISS#2323203)
-  enableFocusRing: true, // TODO(macOS ISS#2323203)
   importantForAccessibility: true,
   nativeID: true,
   testID: true,
-  tabIndex: true, // TODO(win ISS#2323203)
   renderToHardwareTextureAndroid: true,
   shouldRasterizeIOS: true,
   onLayout: true,
@@ -38,12 +35,6 @@ ReactNativeViewAttributes.UIView = {
   onAccessibilityEscape: true,
   collapsable: true,
   needsOffscreenAlphaCompositing: true,
-  onMouseEnter: true, // [TODO(macOS ISS#2323203)
-  onMouseLeave: true,
-  onDragEnter: true,
-  onDragLeave: true,
-  onDrop: true,
-  draggedTypes: true, // ]TODO(macOS ISS#2323203)
   style: ReactNativeStyleAttributes,
 };
 
