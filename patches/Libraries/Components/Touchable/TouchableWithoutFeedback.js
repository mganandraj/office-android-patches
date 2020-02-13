--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Touchable\\TouchableWithoutFeedback.js"	2020-01-30 13:55:47.883607600 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Touchable\\TouchableWithoutFeedback.js"	2020-01-29 14:10:08.874883000 -0800
@@ -35,6 +35,11 @@
   AccessibilityStates,
 } from '../View/ViewAccessibility';
 
+// [TODO(macOS ISS#2323203)
+const {DraggedTypes} = require('DraggedType');
+import type {DraggedTypesType} from 'DraggedType';
+// ]TODO(macOS ISS#2323203)
+
 type TargetEvent = SyntheticEvent<
   $ReadOnly<{|
     target: number,
@@ -82,6 +87,16 @@
   onPress?: ?(event: PressEvent) => mixed,
   onPressIn?: ?(event: PressEvent) => mixed,
   onPressOut?: ?(event: PressEvent) => mixed,
+  onAccessibilityTap?: ?Function, // TODO(OSS Candidate ISS#2710739)
+  acceptsKeyboardFocus?: ?boolean, // [TODO(macOS ISS#2323203)
+  onMouseEnter?: ?Function,
+  onMouseLeave?: ?Function,
+  onDragEnter?: ?Function,
+  onMouseLeave?: ?Function,
+  onDragEnter?: ?Function,
+  onDragLeave?: ?Function,
+  onDrop?: ?Function,
+  draggedTypes?: ?DraggedTypesType, // ]TODO(macOS ISS#2323203)
   pressRetentionOffset?: ?EdgeInsetsProp,
   rejectResponderTermination?: ?boolean,
   testID?: ?string,
@@ -107,6 +122,8 @@
     accessibilityStates: PropTypes.arrayOf(
       PropTypes.oneOf(DeprecatedAccessibilityStates),
     ),
+    onAccessibilityTap: PropTypes.func, // TODO(OSS Candidate ISS#2710739)
+    tabIndex: PropTypes.number, // TODO(macOS/win ISS#2323203)
     /**
      * When `accessible` is true (which is the default) this may be called when
      * the OS-specific concept of "focus" occurs. Some platforms may not have
@@ -124,6 +141,40 @@
      */
     disabled: PropTypes.bool,
     /**
+     * Called when the mouse enters the touchable element
+     */
+    onMouseEnter: PropTypes.func, // TODO(macOS ISS#2323203)
+    /**
+     * Called when the mouse exits the touchable element
+     */
+    onMouseLeave: PropTypes.func, // TODO(macOS ISS#2323203)
+    /**
+     * Fired when a dragged element enters a valid drop target
+     */
+    onDragEnter: PropTypes.func, // TODO(macOS ISS#2323203)
+    /**
+     * Fired when a dragged element leaves a valid drop target
+     */
+    onDragLeave: PropTypes.func, // TODO(macOS ISS#2323203)
+    /**
+     * Fired when an element is dropped on a valid drop target
+     */
+    onDrop: PropTypes.func, // TODO(macOS ISS#2323203)
+    /**
+     * Enables Drag'n'Drop Support for certain types of dragged types
+     *
+     * Possible values for `draggedTypes` are:
+     *
+     * - `'fileUrl'`
+     *
+     * @platform macos
+     */
+    draggedTypes: PropTypes.oneOfType([
+      PropTypes.oneOf(DraggedTypes),
+      PropTypes.arrayOf(PropTypes.oneOf(DraggedTypes)),
+    ]), // TODO(macOS ISS#2323203)
+    tooltip: PropTypes.string, // TODO(macOS/win ISS#2323203)
+    /**
      * Called when the touch is released, but not if cancelled (e.g. by a scroll
      * that steals the responder lock).
      */
@@ -261,9 +312,24 @@
     return (React: any).cloneElement(child, {
       ...overrides,
       accessible: this.props.accessible !== false,
+      accessibilityLabel: this.props.accessibilityLabel,
+      accessibilityHint: this.props.accessibilityHint,
+      accessibilityRole: this.props.accessibilityRole,
+      accessibilityStates: this.props.accessibilityStates,
+      onAccessibilityTap: this.props.onAccessibilityTap, // TODO(OSS Candidate ISS#2710739)
+      acceptsKeyboardFocus:
+        (this.props.acceptsKeyboardFocus === undefined ||
+          this.props.acceptsKeyboardFocus) &&
+        !this.props.disabled, // TODO(macOS ISS#2323203)
+      enableFocusRing:
+        this.props.enableFocusRing === true && !this.props.disabled, // TODO(macOS ISS#2323203)
+      tabIndex: this.props.tabIndex, // TODO(win ISS#2323203)
+      nativeID: this.props.nativeID,
+      testID: this.props.testID,
+      onLayout: this.props.onLayout,
+      hitSlop: this.props.hitSlop,
       clickable:
         this.props.clickable !== false && this.props.onPress !== undefined,
-      onClick: this.touchableHandlePress,
       onStartShouldSetResponder: this.touchableHandleStartShouldSetResponder,
       onResponderTerminationRequest: this
         .touchableHandleResponderTerminationRequest,
@@ -271,6 +337,14 @@
       onResponderMove: this.touchableHandleResponderMove,
       onResponderRelease: this.touchableHandleResponderRelease,
       onResponderTerminate: this.touchableHandleResponderTerminate,
+      tooltip: this.props.tooltip, // TODO(macOS/win ISS#2323203)
+      onClick: this.touchableHandlePress, // TODO(android ISS)
+      onMouseEnter: this.props.onMouseEnter, // [TODO(macOS ISS#2323203)
+      onMouseLeave: this.props.onMouseLeave, // [TODO(macOS ISS#2323203)
+      onDragEnter: this.props.onDragEnter, // [TODO(macOS ISS#2323203)
+      onDragLeave: this.props.onDragLeave, // [TODO(macOS ISS#2323203)
+      onDrop: this.props.onDrop, // [TODO(macOS ISS#2323203)
+      draggedTypes: this.props.draggedTypes, // ]TODO(macOS ISS#2323203)
       children,
     });
   },
