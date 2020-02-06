--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\react-native\\react-native-implementation.js"	2020-01-30 13:55:48.031612300 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\react-native\\react-native-implementation.js"	2020-01-29 14:10:09.037882600 -0800
@@ -181,6 +181,9 @@
   get Alert() {
     return require('Alert');
   },
+  get AlertMacOS() {
+    return require('AlertMacOS');
+  },
   get Animated() {
     return require('Animated');
   },
@@ -217,6 +220,10 @@
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
