diff --git a/E:/github/ms-react-native-forpatch/react-native.config.js b/E:/github/fb-react-native-forpatch/react-native.config.js
index 5d0dd83bc..01d181f56 100644
--- a/E:/github/ms-react-native-forpatch/react-native.config.js
+++ b/E:/github/fb-react-native-forpatch/react-native.config.js
@@ -11,14 +11,8 @@
 const ios = require('@react-native-community/cli-platform-ios');
 const android = require('@react-native-community/cli-platform-android');
 
-// Remove commands so that react-native-macos can coexist with react-native in repos that depend on both.
-const path = require('path');
-const isReactNativeMacOS = path.basename(__dirname) === 'react-native-macos';
-const iosCommands = isReactNativeMacOS ? [] : ios.commands;
-const androidCommands = isReactNativeMacOS ? [] : android.commands;
-
 module.exports = {
-  commands: [...iosCommands, ...androidCommands],
+  commands: [...ios.commands, ...android.commands],
   platforms: {
     ios: {
       linkConfig: ios.linkConfig,
