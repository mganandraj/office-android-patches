diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RNTesterBlock.js" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\RNTesterBlock.js"
index 6999668..de9eac5 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RNTesterBlock.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\RNTesterBlock.js"
@@ -12,6 +12,7 @@
 
 const React = require('react');
 const {StyleSheet, Text, View} = require('react-native');
+import Platform from '../../Libraries/Utilities/Platform'; // TODO(macOS ISS#2323203)
 
 type Props = $ReadOnly<{|
   children?: React.Node,
@@ -47,8 +48,20 @@ const styles = StyleSheet.create({
   container: {
     borderRadius: 3,
     borderWidth: 0.5,
-    borderColor: '#d6d7da',
-    backgroundColor: '#ffffff',
+    ...Platform.select({
+      macos: {
+        borderColor: {semantic: 'separatorColor'},
+        backgroundColor: {semantic: 'windowBackgroundColor'},
+      },
+      ios: {
+        borderColor: {semantic: 'separatorColor'},
+        backgroundColor: {semantic: 'tertiarySystemBackgroundColor'},
+      },
+      default: {
+        borderColor: '#d6d7da',
+        backgroundColor: '#ffffff',
+      },
+    }),
     margin: 10,
     marginVertical: 5,
     overflow: 'hidden',
@@ -57,12 +70,33 @@ const styles = StyleSheet.create({
     borderBottomWidth: 0.5,
     borderTopLeftRadius: 3,
     borderTopRightRadius: 2.5,
-    borderBottomColor: '#d6d7da',
-    backgroundColor: '#f6f7f8',
+    ...Platform.select({
+      macos: {
+        borderBottomColor: {semantic: 'separatorColor'},
+        backgroundColor: {semantic: 'controlBackgroundColor'},
+      },
+      ios: {
+        borderBottomColor: {semantic: 'separatorColor'},
+        backgroundColor: {semantic: 'tertiarySystemBackgroundColor'},
+      },
+      default: {
+        borderBottomColor: '#d6d7da',
+        backgroundColor: '#f6f7f8',
+      },
+    }),
     paddingHorizontal: 10,
     paddingVertical: 5,
   },
   titleText: {
+    ...Platform.select({
+      macos: {
+        color: {semantic: 'labelColor'},
+      },
+      ios: {
+        color: {semantic: 'labelColor'},
+      },
+      default: undefined,
+    }),
     fontSize: 14,
     fontWeight: '500',
   },
