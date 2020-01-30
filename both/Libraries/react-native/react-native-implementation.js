diff --git a/E:/github/ms-react-native-forpatch/Libraries/react-native/react-native-implementation.js b/E:/github/fb-react-native-forpatch/Libraries/react-native/react-native-implementation.js
index 94188dcf3..8a4acfc1d 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/react-native/react-native-implementation.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/react-native/react-native-implementation.js
@@ -181,9 +181,6 @@ module.exports = {
   get Alert() {
     return require('Alert');
   },
-  get AlertMacOS() {
-    return require('AlertMacOS');
-  },
   get Animated() {
     return require('Animated');
   },
@@ -220,10 +217,6 @@ module.exports = {
   get DatePickerAndroid() {
     return require('DatePickerAndroid');
   },
-  // [TODO(macOS ISS#2323203)
-  get DatePickerMacOS() {
-    return require('DatePickerMacOS');
-  }, // ]TODO(macOS ISS#2323203)
   get DeviceInfo() {
     return require('DeviceInfo');
   },
