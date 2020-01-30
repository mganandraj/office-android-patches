diff --git a/E:/github/ms-react-native-forpatch/Libraries/Components/ActivityIndicator/ActivityIndicator.js b/E:/github/fb-react-native-forpatch/Libraries/Components/ActivityIndicator/ActivityIndicator.js
index 5f67851f6..1c4a54c98 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Components/ActivityIndicator/ActivityIndicator.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Components/ActivityIndicator/ActivityIndicator.js
@@ -19,7 +19,6 @@ const RCTActivityIndicatorViewNativeComponent = require('./RCTActivityIndicatorV
 
 import type {NativeComponent} from '../../Renderer/shims/ReactNative';
 import type {ViewProps} from '../View/ViewPropTypes';
-import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
 const RCTActivityIndicator =
   Platform.OS === 'android'
@@ -54,7 +53,7 @@ type Props = $ReadOnly<{|
    *
    * See http://facebook.github.io/react-native/docs/activityindicator.html#color
    */
-  color?: ?(string | NativeOrDynamicColorType), // TODO(macOS ISS#2323203)
+  color?: ?string,
 
   /**
    * Size of the indicator (default is 'small').
