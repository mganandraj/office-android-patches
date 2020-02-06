--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Switch\\SwitchNativeComponent.js"	2020-01-30 13:55:47.876612200 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Switch\\SwitchNativeComponent.js"	2020-01-29 14:10:08.865882000 -0800
@@ -16,15 +16,17 @@
 const requireNativeComponent = require('../../ReactNative/requireNativeComponent');
 
 import type {SwitchChangeEvent} from '../../Types/CoreEventTypes';
+import type {ColorValue} from '../../StyleSheet/StyleSheetTypes';
 import type {ViewProps} from '../View/ViewPropTypes';
+import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // TODO(macOS ISS#2323203)
 
 type SwitchProps = $ReadOnly<{|
   ...ViewProps,
   disabled?: ?boolean,
   onChange?: ?(event: SwitchChangeEvent) => mixed,
-  thumbColor?: ?string,
-  trackColorForFalse?: ?string,
-  trackColorForTrue?: ?string,
+  thumbColor?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
+  trackColorForFalse?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
+  trackColorForTrue?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
   value?: ?boolean,
 |}>;
 
@@ -34,17 +36,17 @@
 
   enabled?: ?boolean,
   on?: ?boolean,
-  thumbTintColor?: ?string,
-  trackTintColor?: ?string,
+  thumbTintColor?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
+  trackTintColor?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
 |}>;
 
 // @see RCTSwitchManager.m
 export type NativeIOSProps = $ReadOnly<{|
   ...SwitchProps,
 
-  onTintColor?: ?string,
-  thumbTintColor?: ?string,
-  tintColor?: ?string,
+  onTintColor?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
+  thumbTintColor?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
+  tintColor?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
 |}>;
 
 type SwitchNativeComponentType = Class<
