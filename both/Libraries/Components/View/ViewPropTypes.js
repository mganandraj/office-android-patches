diff --git a/E:/github/ms-react-native-forpatch/Libraries/Components/View/ViewPropTypes.js b/E:/github/fb-react-native-forpatch/Libraries/Components/View/ViewPropTypes.js
index 36df10f46..861f105b4 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Components/View/ViewPropTypes.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Components/View/ViewPropTypes.js
@@ -10,12 +10,7 @@
 
 'use strict';
 
-import type {
-  PressEvent,
-  Layout,
-  LayoutEvent,
-  ScrollEvent, // TODO(macOS ISS#2323203)
-} from '../../Types/CoreEventTypes';
+import type {PressEvent, Layout, LayoutEvent} from '../../Types/CoreEventTypes';
 import type {EdgeInsetsProp} from '../../StyleSheet/EdgeInsetsPropType';
 import type {Node} from 'react';
 import type {ViewStyleProp} from '../../StyleSheet/StyleSheet';
@@ -25,13 +20,8 @@ import type {
   AccessibilityStates,
   AccessibilityActionEvent,
   AccessibilityActionInfo,
-  AccessibilityNodeInfoProp, // TODO(android ISS)
 } from './ViewAccessibility';
 
-// [TODO(macOS ISS#2323203)
-import type {DraggedTypesType} from 'DraggedType';
-// ]TODO(macOS ISS#2323203)
-
 export type ViewLayout = Layout;
 export type ViewLayoutEvent = LayoutEvent;
 
@@ -51,20 +41,6 @@ type DirectEventProps = $ReadOnly<{|
    */
   onAccessibilityTap?: ?() => void,
 
-  /**
-   * When `accessible` is true, the system will try to invoke this function
-   * when the user performs accessibility double click gesture.
-   */
-  onDoubleClick?: ?(event: SyntheticEvent<{}>) => mixed, // TODO(macOS ISS#2323203)
-
-  /**
-   * When `acceptsKeyboardFocus` is true, the system will try to invoke this function
-   * when the user performs accessibility key down gesture.
-   */
-  onScrollKeyDown?: ?(event: ScrollEvent) => mixed, // TODO(macOS ISS#2323203)
-
-  onMouseEnter?: (event: SyntheticEvent<{}>) => mixed, // [TODO(macOS ISS#2323203)
-
   /**
    * Invoked on mount and layout changes with:
    *
@@ -277,23 +253,6 @@ type AndroidViewProps = $ReadOnly<{|
    */
   needsOffscreenAlphaCompositing?: ?boolean,
 
-  /**
-   * When `true`, indicates that the view is clickable. By default,
-   * all the touchable elements are clickable.
-   *
-   * @platform android
-   */
-  clickable?: ?boolean, // TODO(android ISS)
-
-  /**
-   * When `clickable` is true, the system will try to invoke this function
-   * when the user performs a click.
-   *
-   * @platform android
-   */
-
-  onClick?: ?(event: PressEvent) => mixed, // TODO(android ISS)
-
   /**
    * Indicates to accessibility services whether the user should be notified
    * when this view changes. Works for Android API >= 19 only.
@@ -304,13 +263,6 @@ type AndroidViewProps = $ReadOnly<{|
    */
   accessibilityLiveRegion?: ?('none' | 'polite' | 'assertive'),
 
-  /**
-   * fired when the view focus changes (gain->lose or lose->gain)
-   *
-   * @platform android
-   */
-  onFocusChange?: ?(event: SyntheticEvent<{}>) => mixed, // TODO(android ISS)
-
   /**
    * Controls how view is important for accessibility which is if it
    * fires accessibility events and if it is reported to accessibility services
@@ -322,8 +274,6 @@ type AndroidViewProps = $ReadOnly<{|
    */
   importantForAccessibility?: ?('auto' | 'yes' | 'no' | 'no-hide-descendants'),
 
-  accessibilityNodeInfo?: AccessibilityNodeInfoProp, // TODO(android ISS)
-
   /**
    * TV next focus down (see documentation for the View component).
    *
@@ -360,12 +310,18 @@ type AndroidViewProps = $ReadOnly<{|
   nextFocusUp?: ?number,
 
   /**
-   * When `clickable` is true, the system will try to invoke this function
-   * when the user performs a click.
+   * Whether this `View` should be clickable with a non-touch click, eg. enter key on a hardware keyboard.
    *
    * @platform android
    */
-  onClick?: ?(event: PressEvent) => mixed, // TODO(android ISS)
+  clickable?: boolean,
+
+  /**
+   * The action to perform when this `View` is clicked on by a non-touch click, eg. enter key on a hardware keyboard.
+   *
+   * @platform android
+   */
+  onClick?: () => void,
 |}>;
 
 type IOSViewProps = $ReadOnly<{|
@@ -397,19 +353,10 @@ type IOSViewProps = $ReadOnly<{|
    */
   accessibilityElementsHidden?: ?boolean,
 
-  onDoubleClick?: ?(event: SyntheticEvent<{}>) => mixed, // TODO(macOS ISS#2323203)
-
   /**
-   * When `accessible` is true, the system will try to invoke this function
-   * when the user performs accessibility tap gesture.
+   * Whether this `View` should be rendered as a bitmap before compositing.
    *
-   * See http://facebook.github.io/react-native/docs/view.html#onaccessibilitytap
-   */
-  onAccessibilityTap?: ?() => void,
-
-  /**
-   * When `accessible` is `true`, the system will invoke this function when the
-   * user performs the magic tap gesture.
+   * @platform ios
    *
    * See http://facebook.github.io/react-native/docs/view.html#shouldrasterizeios
    */
@@ -491,8 +438,6 @@ export type ViewProps = $ReadOnly<{|
    */
   nativeID?: ?string,
 
-  tabIndex?: ?number, // TODO(win ISS#2323203)
-
   /**
    * This defines how far a touch event can start away from the view.
    * Typical interface guidelines recommend touch targets that are at least
@@ -524,76 +469,4 @@ export type ViewProps = $ReadOnly<{|
    * See http://facebook.github.io/react-native/docs/view.html#removeclippedsubviews
    */
   removeClippedSubviews?: ?boolean,
-
-  /**
-   * Fired when a pointing device is moved out the view
-   *
-   * @platform macos
-   */
-  onMouseLeave?: ?(event: SyntheticEvent<{}>) => mixed, // TODO(macOS ISS#2323203)
-
-  /**
-   * Fired when a dragged element enters a valid drop target
-   *
-   * @platform macos
-   */
-  onDragEnter?: ?(event: SyntheticEvent<{}>) => mixed, // TODO(macOS ISS#2323203)
-
-  /**
-   * Fired when a dragged element leaves a valid drop target
-   *
-   * @platform macos
-   */
-  onDragLeave?: ?(event: SyntheticEvent<{}>) => mixed, // TODO(macOS ISS#2323203)
-
-  /**
-   * Fired when an element is dropped on a valid drop target
-   *
-   * @platform macos
-   */
-  onDrop?: ?(event: SyntheticEvent<{}>) => mixed, // TODO(macOS ISS#2323203)
-
-  /**
-   * Specifies the Tooltip for the view
-   * @platform macos
-   */
-  tooltip?: ?string, // TODO(macOS ISS#2323203)
-
-  /**
-   * Specifies whether the view participates in the key view loop as user tabs
-   * through different controls.
-   */
-  acceptsKeyboardFocus?: ?boolean, // TODO(macOS ISS#2323203)
-
-  /**
-   * Specifies whether focus ring should be drawn when the view has the first responder status.
-   */
-  enableFocusRing?: ?boolean, // TODO(macOS ISS#2323203)
-
-  /**
-   * Fired when an element is focused
-   *
-   * @platform macos
-   * @platform ios
-   */
-  onFocus?: ?(event: SyntheticEvent<{}>) => mixed, // TODO(macOS ISS#2323203)
-
-  /**
-   * Fired when an element loses focus
-   *
-   * @platform macos
-   * @platform ios
-   */
-  onBlur?: ?(event: SyntheticEvent<{}>) => mixed, // TODO(macOS ISS#2323203)
-
-  /**
-   * Enables Dran'n'Drop Support for certain types of dragged types
-   *
-   * Possible values for `draggedTypes` are:
-   *
-   * - `'fileUrl'`
-   *
-   * @platform macos
-   */
-  draggedTypes?: ?DraggedTypesType, // TODO(macOS ISS#2323203)
 |}>;
