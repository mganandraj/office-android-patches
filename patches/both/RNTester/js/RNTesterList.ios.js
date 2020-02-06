--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RNTesterList.ios.js"	2020-01-30 13:55:48.084616100 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\js\\RNTesterList.ios.js"	2020-01-29 14:10:09.181886200 -0800
@@ -29,6 +29,11 @@
     supportsTVOS: true,
   },
   {
+    key: 'DarkModeExample',
+    module: require('./DarkModeExample'),
+    supportsTVOS: false,
+  },
+  {
     key: 'DatePickerIOSExample',
     module: require('./DatePickerIOSExample'),
     supportsTVOS: false,
@@ -38,6 +43,12 @@
     module: require('./FlatListExample'),
     supportsTVOS: true,
   },
+  // [TODO(OSS Candidate ISS#2710739)
+  {
+    key: 'FocusEvents',
+    module: require('./FocusEventsExample'),
+    supportsTVOS: true,
+  }, // ]TODO(OSS Candidate ISS#2710739)
   {
     key: 'ImageExample',
     module: require('./ImageExample'),
