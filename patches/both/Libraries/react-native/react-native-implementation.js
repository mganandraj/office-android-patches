diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\react-native\\react-native-implementation.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\react-native\\react-native-implementation.js"
index 8a4acfc..94188dc 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\react-native\\react-native-implementation.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\react-native\\react-native-implementation.js"
@@ -181,6 +181,9 @@ module.exports = {
   get Alert() {
     return require('Alert');
   },
+  get AlertMacOS() {
+    return require('AlertMacOS');
+  },
   get Animated() {
     return require('Animated');
   },
@@ -217,6 +220,10 @@ module.exports = {
   get DatePickerAndroid() {
     return require('DatePickerAndroid');
   },
+  // [TODO(macOS ISS#2323203)
+  get DatePickerMacOS() {
+    return require('DatePickerMacOS');
+  }, // ]TODO(macOS ISS#2323203)
   get DeviceInfo() {
     return require('DeviceInfo');
   },
