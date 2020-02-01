diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\ToolbarAndroid\\ToolbarAndroidNativeComponent.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\ToolbarAndroid\\ToolbarAndroidNativeComponent.js"
index e65b4ea..72ec072 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\ToolbarAndroid\\ToolbarAndroidNativeComponent.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\ToolbarAndroid\\ToolbarAndroidNativeComponent.js"
@@ -16,6 +16,7 @@ import type {SyntheticEvent} from '../../Types/CoreEventTypes';
 import type {ImageSource} from '../../Image/ImageSource';
 import type {ViewProps} from '../View/ViewPropTypes';
 import type {NativeComponent} from '../../Renderer/shims/ReactNative';
+import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 type Action = $ReadOnly<{|
   title: string,
@@ -35,7 +36,7 @@ type NativeProps = $ReadOnly<{|
   nativeActions?: Array<Action>,
 |}>;
 
-type ColorValue = null | string;
+type ColorValue = null | string | NativeOrDynamicColorType; // TODO(macOS ISS#2323203)
 
 type ToolbarAndroidProps = $ReadOnly<{|
   ...ViewProps,
