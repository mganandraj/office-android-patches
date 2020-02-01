diff --git "a/E:\\github\\fb-react-native-forpatch-base\\react-native.config.js" "b/E:\\github\\ms-react-native-forpatch\\react-native.config.js"
index 01d181f..5d0dd83 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\react-native.config.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\react-native.config.js"
@@ -11,8 +11,14 @@
 const ios = require('@react-native-community/cli-platform-ios');
 const android = require('@react-native-community/cli-platform-android');
 
+// Remove commands so that react-native-macos can coexist with react-native in repos that depend on both.
+const path = require('path');
+const isReactNativeMacOS = path.basename(__dirname) === 'react-native-macos';
+const iosCommands = isReactNativeMacOS ? [] : ios.commands;
+const androidCommands = isReactNativeMacOS ? [] : android.commands;
+
 module.exports = {
-  commands: [...ios.commands, ...android.commands],
+  commands: [...iosCommands, ...androidCommands],
   platforms: {
     ios: {
       linkConfig: ios.linkConfig,
