--- "E:\\github\\fb-react-native-forpatch-base\\react-native.config.js"	2020-01-30 13:55:48.656608700 -0800
+++ "E:\\github\\ms-react-native-forpatch\\react-native.config.js"	2020-01-29 14:10:10.013926400 -0800
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
