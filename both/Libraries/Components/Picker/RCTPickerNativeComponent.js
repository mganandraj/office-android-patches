diff --git a/E:/github/ms-react-native-forpatch/Libraries/Components/Picker/RCTPickerNativeComponent.js b/E:/github/fb-react-native-forpatch/Libraries/Components/Picker/RCTPickerNativeComponent.js
index 85f161cc8..6db9d496f 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Components/Picker/RCTPickerNativeComponent.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Components/Picker/RCTPickerNativeComponent.js
@@ -14,7 +14,6 @@ const requireNativeComponent = require('../../ReactNative/requireNativeComponent
 import type {SyntheticEvent} from '../../Types/CoreEventTypes';
 import type {TextStyleProp} from '../../StyleSheet/StyleSheet';
 import type {NativeComponent} from '../../Renderer/shims/ReactNative';
-import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 type PickerIOSChangeEvent = SyntheticEvent<
   $ReadOnly<{|
@@ -26,7 +25,7 @@ type PickerIOSChangeEvent = SyntheticEvent<
 type RCTPickerIOSItemType = $ReadOnly<{|
   label: ?Label,
   value: ?(number | string),
-  textColor: ?(number | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
+  textColor: ?number,
 |}>;
 
 type Label = Stringish | number;
