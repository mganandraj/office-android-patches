diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Picker\\PickerIOS.ios.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Picker\\PickerIOS.ios.js"
index 382b6df..0440c6b 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Picker\\PickerIOS.ios.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Picker\\PickerIOS.ios.js"
@@ -24,6 +24,7 @@ import type {SyntheticEvent} from '../../Types/CoreEventTypes';
 import type {ColorValue} from '../../StyleSheet/StyleSheetTypes';
 import type {ViewProps} from '../View/ViewPropTypes';
 import type {TextStyleProp} from '../../StyleSheet/StyleSheet';
+import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 type PickerIOSChangeEvent = SyntheticEvent<
   $ReadOnly<{|
@@ -35,7 +36,7 @@ type PickerIOSChangeEvent = SyntheticEvent<
 type RCTPickerIOSItemType = $ReadOnly<{|
   label: ?Label,
   value: ?(number | string),
-  textColor: ?number,
+  textColor: ?(number | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
 |}>;
 
 type RCTPickerIOSType = Class<
