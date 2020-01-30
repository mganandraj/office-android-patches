diff --git a/E:/github/ms-react-native-forpatch/Libraries/Components/CheckBox/AndroidCheckBoxNativeComponent.js b/E:/github/fb-react-native-forpatch/Libraries/Components/CheckBox/AndroidCheckBoxNativeComponent.js
index 4c68a279f..097cba176 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Components/CheckBox/AndroidCheckBoxNativeComponent.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Components/CheckBox/AndroidCheckBoxNativeComponent.js
@@ -14,7 +14,6 @@ const requireNativeComponent = require('../../ReactNative/requireNativeComponent
 import type {ViewProps} from '../View/ViewPropTypes';
 import type {SyntheticEvent} from '../../Types/CoreEventTypes';
 import type {NativeComponent} from '../../Renderer/shims/ReactNative';
-import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 type CheckBoxEvent = SyntheticEvent<
   $ReadOnly<{|
@@ -43,12 +42,7 @@ type NativeProps = $ReadOnly<{|
 
   on?: ?boolean,
   enabled?: boolean,
-  tintColors:
-    | {|
-        true: ?(number | NativeOrDynamicColorType),
-        false: ?(number | NativeOrDynamicColorType),
-      |}
-    | typeof undefined,
+  tintColors: {|true: ?number, false: ?number|} | typeof undefined,
 |}>;
 
 type CheckBoxNativeType = Class<NativeComponent<NativeProps>>;
