diff --git a/E:/github/ms-react-native-forpatch/Libraries/Components/Touchable/TouchableWithoutFeedback.js b/E:/github/fb-react-native-forpatch/Libraries/Components/Touchable/TouchableWithoutFeedback.js
index 9378b37e7..887a98053 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Components/Touchable/TouchableWithoutFeedback.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Components/Touchable/TouchableWithoutFeedback.js
@@ -35,11 +35,6 @@ import type {
   AccessibilityStates,
 } from '../View/ViewAccessibility';
 
-// [TODO(macOS ISS#2323203)
-const {DraggedTypes} = require('DraggedType');
-import type {DraggedTypesType} from 'DraggedType';
-// ]TODO(macOS ISS#2323203)
-
 type TargetEvent = SyntheticEvent<
   $ReadOnly<{|
     target: number,
@@ -87,16 +82,6 @@ export type Props = $ReadOnly<{|
   onPress?: ?(event: PressEvent) => mixed,
   onPressIn?: ?(event: PressEvent) => mixed,
   onPressOut?: ?(event: PressEvent) => mixed,
-  onAccessibilityTap?: ?Function, // TODO(OSS Candidate ISS#2710739)
-  acceptsKeyboardFocus?: ?boolean, // [TODO(macOS ISS#2323203)
-  onMouseEnter?: ?Function,
-  onMouseLeave?: ?Function,
-  onDragEnter?: ?Function,
-  onMouseLeave?: ?Function,
-  onDragEnter?: ?Function,
-  onDragLeave?: ?Function,
-  onDrop?: ?Function,
-  draggedTypes?: ?DraggedTypesType, // ]TODO(macOS ISS#2323203)
   pressRetentionOffset?: ?EdgeInsetsProp,
   rejectResponderTermination?: ?boolean,
   testID?: ?string,
@@ -122,8 +107,6 @@ const TouchableWithoutFeedback = ((createReactClass({
     accessibilityStates: PropTypes.arrayOf(
       PropTypes.oneOf(DeprecatedAccessibilityStates),
     ),
-    onAccessibilityTap: PropTypes.func, // TODO(OSS Candidate ISS#2710739)
-    tabIndex: PropTypes.number, // TODO(macOS/win ISS#2323203)
     /**
      * When `accessible` is true (which is the default) this may be called when
      * the OS-specific concept of "focus" occurs. Some platforms may not have
@@ -140,40 +123,6 @@ const TouchableWithoutFeedback = ((createReactClass({
      * If true, disable all interactions for this component.
      */
     disabled: PropTypes.bool,
-    /**
-     * Called when the mouse enters the touchable element
-     */
-    onMouseEnter: PropTypes.func, // TODO(macOS ISS#2323203)
-    /**
-     * Called when the mouse exits the touchable element
-     */
-    onMouseLeave: PropTypes.func, // TODO(macOS ISS#2323203)
-    /**
-     * Fired when a dragged element enters a valid drop target
-     */
-    onDragEnter: PropTypes.func, // TODO(macOS ISS#2323203)
-    /**
-     * Fired when a dragged element leaves a valid drop target
-     */
-    onDragLeave: PropTypes.func, // TODO(macOS ISS#2323203)
-    /**
-     * Fired when an element is dropped on a valid drop target
-     */
-    onDrop: PropTypes.func, // TODO(macOS ISS#2323203)
-    /**
-     * Enables Drag'n'Drop Support for certain types of dragged types
-     *
-     * Possible values for `draggedTypes` are:
-     *
-     * - `'fileUrl'`
-     *
-     * @platform macos
-     */
-    draggedTypes: PropTypes.oneOfType([
-      PropTypes.oneOf(DraggedTypes),
-      PropTypes.arrayOf(PropTypes.oneOf(DraggedTypes)),
-    ]), // TODO(macOS ISS#2323203)
-    tooltip: PropTypes.string, // TODO(macOS/win ISS#2323203)
     /**
      * Called when the touch is released, but not if cancelled (e.g. by a scroll
      * that steals the responder lock).
@@ -312,24 +261,9 @@ const TouchableWithoutFeedback = ((createReactClass({
     return (React: any).cloneElement(child, {
       ...overrides,
       accessible: this.props.accessible !== false,
-      accessibilityLabel: this.props.accessibilityLabel,
-      accessibilityHint: this.props.accessibilityHint,
-      accessibilityRole: this.props.accessibilityRole,
-      accessibilityStates: this.props.accessibilityStates,
-      onAccessibilityTap: this.props.onAccessibilityTap, // TODO(OSS Candidate ISS#2710739)
-      acceptsKeyboardFocus:
-        (this.props.acceptsKeyboardFocus === undefined ||
-          this.props.acceptsKeyboardFocus) &&
-        !this.props.disabled, // TODO(macOS ISS#2323203)
-      enableFocusRing:
-        this.props.enableFocusRing === true && !this.props.disabled, // TODO(macOS ISS#2323203)
-      tabIndex: this.props.tabIndex, // TODO(win ISS#2323203)
-      nativeID: this.props.nativeID,
-      testID: this.props.testID,
-      onLayout: this.props.onLayout,
-      hitSlop: this.props.hitSlop,
       clickable:
         this.props.clickable !== false && this.props.onPress !== undefined,
+      onClick: this.touchableHandlePress,
       onStartShouldSetResponder: this.touchableHandleStartShouldSetResponder,
       onResponderTerminationRequest: this
         .touchableHandleResponderTerminationRequest,
@@ -337,14 +271,6 @@ const TouchableWithoutFeedback = ((createReactClass({
       onResponderMove: this.touchableHandleResponderMove,
       onResponderRelease: this.touchableHandleResponderRelease,
       onResponderTerminate: this.touchableHandleResponderTerminate,
-      tooltip: this.props.tooltip, // TODO(macOS/win ISS#2323203)
-      onClick: this.touchableHandlePress, // TODO(android ISS)
-      onMouseEnter: this.props.onMouseEnter, // [TODO(macOS ISS#2323203)
-      onMouseLeave: this.props.onMouseLeave, // [TODO(macOS ISS#2323203)
-      onDragEnter: this.props.onDragEnter, // [TODO(macOS ISS#2323203)
-      onDragLeave: this.props.onDragLeave, // [TODO(macOS ISS#2323203)
-      onDrop: this.props.onDrop, // [TODO(macOS ISS#2323203)
-      draggedTypes: this.props.draggedTypes, // ]TODO(macOS ISS#2323203)
       children,
     });
   },
