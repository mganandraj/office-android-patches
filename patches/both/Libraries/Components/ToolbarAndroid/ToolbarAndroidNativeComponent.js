--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\ToolbarAndroid\\ToolbarAndroidNativeComponent.js"	2020-01-30 13:55:47.880618300 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\ToolbarAndroid\\ToolbarAndroidNativeComponent.js"	2020-01-29 14:10:08.872883500 -0800
@@ -16,6 +16,7 @@
 import type {ImageSource} from '../../Image/ImageSource';
 import type {ViewProps} from '../View/ViewPropTypes';
 import type {NativeComponent} from '../../Renderer/shims/ReactNative';
+import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 type Action = $ReadOnly<{|
   title: string,
@@ -35,7 +36,7 @@
   nativeActions?: Array<Action>,
 |}>;
 
-type ColorValue = null | string;
+type ColorValue = null | string | NativeOrDynamicColorType; // TODO(macOS ISS#2323203)
 
 type ToolbarAndroidProps = $ReadOnly<{|
   ...ViewProps,
