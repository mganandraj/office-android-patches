diff --git a/E:/github/ms-react-native-forpatch/Libraries/Components/Switch/SwitchNativeComponent.js b/E:/github/fb-react-native-forpatch/Libraries/Components/Switch/SwitchNativeComponent.js
index 20b225464..b3be4dfaa 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Components/Switch/SwitchNativeComponent.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Components/Switch/SwitchNativeComponent.js
@@ -16,17 +16,15 @@ const ReactNative = require('../../Renderer/shims/ReactNative');
 const requireNativeComponent = require('../../ReactNative/requireNativeComponent');
 
 import type {SwitchChangeEvent} from '../../Types/CoreEventTypes';
-import type {ColorValue} from '../../StyleSheet/StyleSheetTypes';
 import type {ViewProps} from '../View/ViewPropTypes';
-import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // TODO(macOS ISS#2323203)
 
 type SwitchProps = $ReadOnly<{|
   ...ViewProps,
   disabled?: ?boolean,
   onChange?: ?(event: SwitchChangeEvent) => mixed,
-  thumbColor?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
-  trackColorForFalse?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
-  trackColorForTrue?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
+  thumbColor?: ?string,
+  trackColorForFalse?: ?string,
+  trackColorForTrue?: ?string,
   value?: ?boolean,
 |}>;
 
@@ -36,17 +34,17 @@ export type NativeAndroidProps = $ReadOnly<{|
 
   enabled?: ?boolean,
   on?: ?boolean,
-  thumbTintColor?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
-  trackTintColor?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
+  thumbTintColor?: ?string,
+  trackTintColor?: ?string,
 |}>;
 
 // @see RCTSwitchManager.m
 export type NativeIOSProps = $ReadOnly<{|
   ...SwitchProps,
 
-  onTintColor?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
-  thumbTintColor?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
-  tintColor?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
+  onTintColor?: ?string,
+  thumbTintColor?: ?string,
+  tintColor?: ?string,
 |}>;
 
 type SwitchNativeComponentType = Class<
