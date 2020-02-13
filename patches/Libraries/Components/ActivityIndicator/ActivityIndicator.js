--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\ActivityIndicator\\ActivityIndicator.js"	2020-01-30 13:55:47.854607500 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Components\\ActivityIndicator\\ActivityIndicator.js"	2020-01-29 14:10:08.830882900 -0800
@@ -19,6 +19,7 @@
 
 import type {NativeComponent} from '../../Renderer/shims/ReactNative';
 import type {ViewProps} from '../View/ViewPropTypes';
+import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 const RCTActivityIndicator =
   Platform.OS === 'android'
@@ -53,7 +54,7 @@
    *
    * See http://facebook.github.io/react-native/docs/activityindicator.html#color
    */
-  color?: ?string,
+  color?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
 
   /**
    * Size of the indicator (default is 'small').
