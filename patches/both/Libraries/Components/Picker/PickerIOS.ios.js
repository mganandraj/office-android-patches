--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Picker\\PickerIOS.ios.js"	2020-01-30 13:55:47.865606900 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Picker\\PickerIOS.ios.js"	2020-01-29 14:10:08.845882500 -0800
@@ -24,6 +24,7 @@
 import type {ColorValue} from '../../StyleSheet/StyleSheetTypes';
 import type {ViewProps} from '../View/ViewPropTypes';
 import type {TextStyleProp} from '../../StyleSheet/StyleSheet';
+import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 type PickerIOSChangeEvent = SyntheticEvent<
   $ReadOnly<{|
@@ -35,7 +36,7 @@
 type RCTPickerIOSItemType = $ReadOnly<{|
   label: ?Label,
   value: ?(number | string),
-  textColor: ?number,
+  textColor: ?(number | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
 |}>;
 
 type RCTPickerIOSType = Class<
