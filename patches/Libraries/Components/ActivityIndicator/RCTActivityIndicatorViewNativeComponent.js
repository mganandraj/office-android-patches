--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\ActivityIndicator\\RCTActivityIndicatorViewNativeComponent.js"	2020-01-30 13:55:47.854607500 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Components\\ActivityIndicator\\RCTActivityIndicatorViewNativeComponent.js"	2020-01-29 14:10:08.830882900 -0800
@@ -15,6 +15,7 @@
 import type {ViewProps} from '../View/ViewPropTypes';
 import type {ViewStyleProp} from '../../StyleSheet/StyleSheet';
 import type {NativeComponent} from '../../Renderer/shims/ReactNative';
+import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 type NativeProps = $ReadOnly<{|
   ...ViewProps,
@@ -38,7 +39,7 @@
    *
    * See http://facebook.github.io/react-native/docs/activityindicator.html#color
    */
-  color?: ?string,
+  color?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
 
   /**
    * Size of the indicator (default is 'small').
