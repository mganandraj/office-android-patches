diff --git a/E:/github/ms-react-native-forpatch/Libraries/Components/Picker/PickerIOS.ios.js b/E:/github/fb-react-native-forpatch/Libraries/Components/Picker/PickerIOS.ios.js
index 0440c6b53..382b6df61 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Components/Picker/PickerIOS.ios.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Components/Picker/PickerIOS.ios.js
@@ -24,7 +24,6 @@ import type {SyntheticEvent} from '../../Types/CoreEventTypes';
 import type {ColorValue} from '../../StyleSheet/StyleSheetTypes';
 import type {ViewProps} from '../View/ViewPropTypes';
 import type {TextStyleProp} from '../../StyleSheet/StyleSheet';
-import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 type PickerIOSChangeEvent = SyntheticEvent<
   $ReadOnly<{|
@@ -36,7 +35,7 @@ type PickerIOSChangeEvent = SyntheticEvent<
 type RCTPickerIOSItemType = $ReadOnly<{|
   label: ?Label,
   value: ?(number | string),
-  textColor: ?(number | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
+  textColor: ?number,
 |}>;
 
 type RCTPickerIOSType = Class<
