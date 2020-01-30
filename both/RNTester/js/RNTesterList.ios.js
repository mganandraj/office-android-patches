diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/RNTesterList.ios.js b/E:/github/fb-react-native-forpatch/RNTester/js/RNTesterList.ios.js
index cbee3a3a5..c0ff9a2f5 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/RNTesterList.ios.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/RNTesterList.ios.js
@@ -28,11 +28,6 @@ const ComponentExamples: Array<RNTesterExample> = [
     module: require('./ButtonExample'),
     supportsTVOS: true,
   },
-  {
-    key: 'DarkModeExample',
-    module: require('./DarkModeExample'),
-    supportsTVOS: false,
-  },
   {
     key: 'DatePickerIOSExample',
     module: require('./DatePickerIOSExample'),
@@ -43,12 +38,6 @@ const ComponentExamples: Array<RNTesterExample> = [
     module: require('./FlatListExample'),
     supportsTVOS: true,
   },
-  // [TODO(OSS Candidate ISS#2710739)
-  {
-    key: 'FocusEvents',
-    module: require('./FocusEventsExample'),
-    supportsTVOS: true,
-  }, // ]TODO(OSS Candidate ISS#2710739)
   {
     key: 'ImageExample',
     module: require('./ImageExample'),
