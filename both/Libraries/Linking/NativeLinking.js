diff --git a/E:/github/ms-react-native-forpatch/Libraries/Linking/NativeLinking.js b/E:/github/fb-react-native-forpatch/Libraries/Linking/NativeLinking.js
index 8608a0aae..2fa0d78d3 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Linking/NativeLinking.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Linking/NativeLinking.js
@@ -12,7 +12,7 @@
 
 import type {TurboModule} from 'RCTExport';
 import * as TurboModuleRegistry from 'TurboModuleRegistry';
-import Platform from '../Utilities/Platform';
+import Platform from 'Platform';
 
 export interface Spec extends TurboModule {
   // Common interface
@@ -32,6 +32,6 @@ export interface Spec extends TurboModule {
   +removeListeners: (count: number) => void;
 }
 
-export default ((Platform.OS === 'android'
-  ? TurboModuleRegistry.getEnforcing<Spec>('IntentAndroid')
-  : TurboModuleRegistry.getEnforcing<Spec>('LinkingManager')): Spec);
+export default (Platform.OS === 'ios'
+  ? TurboModuleRegistry.getEnforcing<Spec>('LinkingManager')
+  : TurboModuleRegistry.getEnforcing<Spec>('IntentAndroid'));
