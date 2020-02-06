--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Picker\\RCTPickerNativeComponent.js"	2020-01-30 13:55:47.865606900 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Picker\\RCTPickerNativeComponent.js"	2020-01-29 14:10:08.846883800 -0800
@@ -14,6 +14,7 @@
 import type {SyntheticEvent} from '../../Types/CoreEventTypes';
 import type {TextStyleProp} from '../../StyleSheet/StyleSheet';
 import type {NativeComponent} from '../../Renderer/shims/ReactNative';
+import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 type PickerIOSChangeEvent = SyntheticEvent<
   $ReadOnly<{|
@@ -25,7 +26,7 @@
 type RCTPickerIOSItemType = $ReadOnly<{|
   label: ?Label,
   value: ?(number | string),
-  textColor: ?number,
+  textColor: ?(number | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
 |}>;
 
 type Label = Stringish | number;
