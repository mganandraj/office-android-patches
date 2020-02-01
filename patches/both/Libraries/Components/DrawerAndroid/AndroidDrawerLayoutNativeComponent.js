diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\DrawerAndroid\\AndroidDrawerLayoutNativeComponent.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\DrawerAndroid\\AndroidDrawerLayoutNativeComponent.js"
index 177bec5..e879fcd 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\DrawerAndroid\\AndroidDrawerLayoutNativeComponent.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\DrawerAndroid\\AndroidDrawerLayoutNativeComponent.js"
@@ -16,8 +16,9 @@ import type {NativeComponent} from '../../Renderer/shims/ReactNative';
 import type {SyntheticEvent} from '../../Types/CoreEventTypes';
 import type {ViewStyleProp} from '../../StyleSheet/StyleSheet';
 import type {Element, Node} from 'react';
+import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
-type ColorValue = null | string;
+type ColorValue = null | string | NativeOrDynamicColorType; // TODO(macOS ISS#2323203)
 
 type DrawerStates = 'Idle' | 'Dragging' | 'Settling';
 
