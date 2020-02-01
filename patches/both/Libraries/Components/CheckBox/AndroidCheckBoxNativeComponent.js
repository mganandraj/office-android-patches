diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\CheckBox\\AndroidCheckBoxNativeComponent.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\CheckBox\\AndroidCheckBoxNativeComponent.js"
index 097cba1..4c68a27 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\CheckBox\\AndroidCheckBoxNativeComponent.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\CheckBox\\AndroidCheckBoxNativeComponent.js"
@@ -14,6 +14,7 @@ const requireNativeComponent = require('../../ReactNative/requireNativeComponent
 import type {ViewProps} from '../View/ViewPropTypes';
 import type {SyntheticEvent} from '../../Types/CoreEventTypes';
 import type {NativeComponent} from '../../Renderer/shims/ReactNative';
+import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 type CheckBoxEvent = SyntheticEvent<
   $ReadOnly<{|
@@ -42,7 +43,12 @@ type NativeProps = $ReadOnly<{|
 
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
