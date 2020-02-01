diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Picker\\RCTPickerNativeComponent.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Picker\\RCTPickerNativeComponent.js"
index 6db9d49..85f161c 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Picker\\RCTPickerNativeComponent.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Picker\\RCTPickerNativeComponent.js"
@@ -14,6 +14,7 @@ const requireNativeComponent = require('../../ReactNative/requireNativeComponent
 import type {SyntheticEvent} from '../../Types/CoreEventTypes';
 import type {TextStyleProp} from '../../StyleSheet/StyleSheet';
 import type {NativeComponent} from '../../Renderer/shims/ReactNative';
+import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 type PickerIOSChangeEvent = SyntheticEvent<
   $ReadOnly<{|
@@ -25,7 +26,7 @@ type PickerIOSChangeEvent = SyntheticEvent<
 type RCTPickerIOSItemType = $ReadOnly<{|
   label: ?Label,
   value: ?(number | string),
-  textColor: ?number,
+  textColor: ?(number | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
 |}>;
 
 type Label = Stringish | number;
