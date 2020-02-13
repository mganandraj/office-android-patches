--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\CheckBox\\AndroidCheckBoxNativeComponent.js"	2020-01-30 13:55:47.857612500 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Components\\CheckBox\\AndroidCheckBoxNativeComponent.js"	2020-01-29 14:10:08.833882900 -0800
@@ -14,6 +14,7 @@
 import type {ViewProps} from '../View/ViewPropTypes';
 import type {SyntheticEvent} from '../../Types/CoreEventTypes';
 import type {NativeComponent} from '../../Renderer/shims/ReactNative';
+import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 type CheckBoxEvent = SyntheticEvent<
   $ReadOnly<{|
@@ -42,7 +43,12 @@
 
   on?: ?boolean,
   enabled?: boolean,
-  tintColors: {|true: ?number, false: ?number|} | typeof undefined,
+  tintColors:
+    | {|
+        true: ?(number | NativeOrDynamicColorType),
+        false: ?(number | NativeOrDynamicColorType),
+      |}
+    | typeof undefined,
 |}>;
 
 type CheckBoxNativeType = Class<NativeComponent<NativeProps>>;
