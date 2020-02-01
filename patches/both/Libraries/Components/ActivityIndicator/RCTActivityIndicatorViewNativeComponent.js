diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\ActivityIndicator\\RCTActivityIndicatorViewNativeComponent.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\ActivityIndicator\\RCTActivityIndicatorViewNativeComponent.js"
index e1d2be9..3c278b2 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\ActivityIndicator\\RCTActivityIndicatorViewNativeComponent.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\ActivityIndicator\\RCTActivityIndicatorViewNativeComponent.js"
@@ -15,6 +15,7 @@ const requireNativeComponent = require('../../ReactNative/requireNativeComponent
 import type {ViewProps} from '../View/ViewPropTypes';
 import type {ViewStyleProp} from '../../StyleSheet/StyleSheet';
 import type {NativeComponent} from '../../Renderer/shims/ReactNative';
+import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 type NativeProps = $ReadOnly<{|
   ...ViewProps,
@@ -38,7 +39,7 @@ type NativeProps = $ReadOnly<{|
    *
    * See http://facebook.github.io/react-native/docs/activityindicator.html#color
    */
-  color?: ?string,
+  color?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
 
   /**
    * Size of the indicator (default is 'small').
