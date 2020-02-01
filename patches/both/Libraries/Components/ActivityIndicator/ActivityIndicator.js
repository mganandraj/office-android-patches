diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\ActivityIndicator\\ActivityIndicator.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\ActivityIndicator\\ActivityIndicator.js"
index 1c4a54c..5f67851 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\ActivityIndicator\\ActivityIndicator.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\ActivityIndicator\\ActivityIndicator.js"
@@ -19,6 +19,7 @@ const RCTActivityIndicatorViewNativeComponent = require('./RCTActivityIndicatorV
 
 import type {NativeComponent} from '../../Renderer/shims/ReactNative';
 import type {ViewProps} from '../View/ViewPropTypes';
+import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 const RCTActivityIndicator =
   Platform.OS === 'android'
@@ -53,7 +54,7 @@ type Props = $ReadOnly<{|
    *
    * See http://facebook.github.io/react-native/docs/activityindicator.html#color
    */
-  color?: ?string,
+  color?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
 
   /**
    * Size of the indicator (default is 'small').
