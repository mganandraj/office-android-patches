diff --git a/E:/github/ms-react-native-forpatch/Libraries/Components/ActivityIndicator/RCTActivityIndicatorViewNativeComponent.js b/E:/github/fb-react-native-forpatch/Libraries/Components/ActivityIndicator/RCTActivityIndicatorViewNativeComponent.js
index 3c278b2f8..e1d2be929 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Components/ActivityIndicator/RCTActivityIndicatorViewNativeComponent.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Components/ActivityIndicator/RCTActivityIndicatorViewNativeComponent.js
@@ -15,7 +15,6 @@ const requireNativeComponent = require('../../ReactNative/requireNativeComponent
 import type {ViewProps} from '../View/ViewPropTypes';
 import type {ViewStyleProp} from '../../StyleSheet/StyleSheet';
 import type {NativeComponent} from '../../Renderer/shims/ReactNative';
-import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 type NativeProps = $ReadOnly<{|
   ...ViewProps,
@@ -39,7 +38,7 @@ type NativeProps = $ReadOnly<{|
    *
    * See http://facebook.github.io/react-native/docs/activityindicator.html#color
    */
-  color?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
+  color?: ?string,
 
   /**
    * Size of the indicator (default is 'small').
