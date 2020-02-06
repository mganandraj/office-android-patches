--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\DrawerAndroid\\AndroidDrawerLayoutNativeComponent.js"	2020-01-30 13:55:47.859607700 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\DrawerAndroid\\AndroidDrawerLayoutNativeComponent.js"	2020-01-29 14:10:08.838883900 -0800
@@ -16,8 +16,9 @@
 import type {SyntheticEvent} from '../../Types/CoreEventTypes';
 import type {ViewStyleProp} from '../../StyleSheet/StyleSheet';
 import type {Element, Node} from 'react';
+import type {NativeOrDynamicColorType} from '../../Color/NativeOrDynamicColorType'; // ]TODO(macOS ISS#2323203)
 
-type ColorValue = null | string;
+type ColorValue = null | string | NativeOrDynamicColorType; // TODO(macOS ISS#2323203)
 
 type DrawerStates = 'Idle' | 'Dragging' | 'Settling';
 
