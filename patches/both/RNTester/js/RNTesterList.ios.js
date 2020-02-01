diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RNTesterList.ios.js" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\RNTesterList.ios.js"
index c0ff9a2..cbee3a3 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RNTesterList.ios.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\RNTesterList.ios.js"
@@ -28,6 +28,11 @@ const ComponentExamples: Array<RNTesterExample> = [
     module: require('./ButtonExample'),
     supportsTVOS: true,
   },
+  {
+    key: 'DarkModeExample',
+    module: require('./DarkModeExample'),
+    supportsTVOS: false,
+  },
   {
     key: 'DatePickerIOSExample',
     module: require('./DatePickerIOSExample'),
@@ -38,6 +43,12 @@ const ComponentExamples: Array<RNTesterExample> = [
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
