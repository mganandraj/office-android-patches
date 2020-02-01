diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Touchable\\TouchableNativeFeedback.android.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Touchable\\TouchableNativeFeedback.android.js"
index 1bd0d27..45ad1e6 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Touchable\\TouchableNativeFeedback.android.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Touchable\\TouchableNativeFeedback.android.js"
@@ -24,6 +24,7 @@ const ensurePositiveDelayProps = require('./ensurePositiveDelayProps');
 const processColor = require('../../StyleSheet/processColor');
 
 import type {PressEvent} from '../../Types/CoreEventTypes';
+import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 const rippleBackgroundPropType = PropTypes.shape({
   type: PropTypes.oneOf(['RippleAndroid']),
@@ -170,7 +171,7 @@ const TouchableNativeFeedback = createReactClass({
       borderless: boolean,
     ): {
       type: 'RippleAndroid',
-      color: ?number,
+      color: ?(number | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
       borderless: boolean,
     } {
       return {
@@ -312,8 +313,10 @@ const TouchableNativeFeedback = createReactClass({
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
