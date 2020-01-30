diff --git a/E:/github/ms-react-native-forpatch/Libraries/Components/ToolbarAndroid/ToolbarAndroidNativeComponent.js b/E:/github/fb-react-native-forpatch/Libraries/Components/ToolbarAndroid/ToolbarAndroidNativeComponent.js
index 72ec07271..e65b4eabe 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Components/ToolbarAndroid/ToolbarAndroidNativeComponent.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Components/ToolbarAndroid/ToolbarAndroidNativeComponent.js
@@ -16,7 +16,6 @@ import type {SyntheticEvent} from '../../Types/CoreEventTypes';
 import type {ImageSource} from '../../Image/ImageSource';
 import type {ViewProps} from '../View/ViewPropTypes';
 import type {NativeComponent} from '../../Renderer/shims/ReactNative';
-import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 type Action = $ReadOnly<{|
   title: string,
@@ -36,7 +35,7 @@ type NativeProps = $ReadOnly<{|
   nativeActions?: Array<Action>,
 |}>;
 
-type ColorValue = null | string | NativeOrDynamicColorType; // TODO(macOS ISS#2323203)
+type ColorValue = null | string;
 
 type ToolbarAndroidProps = $ReadOnly<{|
   ...ViewProps,
