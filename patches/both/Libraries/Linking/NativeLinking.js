--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Linking\\NativeLinking.js"	2020-01-30 13:55:47.921613500 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Linking\\NativeLinking.js"	2020-01-29 14:10:08.920883300 -0800
@@ -12,7 +12,7 @@
 
 import type {TurboModule} from 'RCTExport';
 import * as TurboModuleRegistry from 'TurboModuleRegistry';
-import Platform from 'Platform';
+import Platform from '../Utilities/Platform';
 
 export interface Spec extends TurboModule {
   // Common interface
@@ -32,6 +32,6 @@
   +removeListeners: (count: number) => void;
 }
 
-export default (Platform.OS === 'ios'
-  ? TurboModuleRegistry.getEnforcing<Spec>('LinkingManager')
-  : TurboModuleRegistry.getEnforcing<Spec>('IntentAndroid'));
+export default ((Platform.OS === 'android'
+  ? TurboModuleRegistry.getEnforcing<Spec>('IntentAndroid')
+  : TurboModuleRegistry.getEnforcing<Spec>('LinkingManager')): Spec);
