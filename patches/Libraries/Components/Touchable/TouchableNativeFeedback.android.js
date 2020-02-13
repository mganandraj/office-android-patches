--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Touchable\\TouchableNativeFeedback.android.js"	2020-01-30 13:55:47.882607500 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Touchable\\TouchableNativeFeedback.android.js"	2020-01-29 14:10:08.874883000 -0800
@@ -24,6 +24,7 @@
 const processColor = require('../../StyleSheet/processColor');
 
 import type {PressEvent} from '../../Types/CoreEventTypes';
+import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 const rippleBackgroundPropType = PropTypes.shape({
   type: PropTypes.oneOf(['RippleAndroid']),
@@ -170,7 +171,7 @@
       borderless: boolean,
     ): {
       type: 'RippleAndroid',
-      color: ?number,
+      color: ?(number | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
       borderless: boolean,
     } {
       return {
@@ -312,8 +313,10 @@
       [drawableProp]: this.props.background,
       accessible: this.props.accessible !== false,
       accessibilityLabel: this.props.accessibilityLabel,
+      accessibilityHint: this.props.accessibilityHint, // TODO(OSS Candidate ISS#2710739)
       accessibilityRole: this.props.accessibilityRole,
       accessibilityStates: this.props.accessibilityStates,
+      onAccessibilityTap: this.props.onAccessibilityTap, // TODO(OSS Candidate ISS#2710739)
       children,
       testID: this.props.testID,
       onLayout: this.props.onLayout,
