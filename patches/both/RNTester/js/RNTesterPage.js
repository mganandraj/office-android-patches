diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RNTesterPage.js" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\RNTesterPage.js"
index 6b1b0fe..e5f18e1 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RNTesterPage.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\RNTesterPage.js"
@@ -11,6 +11,7 @@
 'use strict';
 
 const React = require('react');
+import Platform from '../../Libraries/Utilities/Platform'; // TODO(OSS Candidate ISS#2710739)
 const {ScrollView, StyleSheet, View} = require('react-native');
 
 const RNTesterTitle = require('./RNTesterTitle');
@@ -52,7 +53,17 @@ class RNTesterPage extends React.Component<Props> {
 
 const styles = StyleSheet.create({
   container: {
-    backgroundColor: '#e9eaed',
+    ...Platform.select({
+      ios: {
+        backgroundColor: {semantic: 'secondarySystemBackgroundColor'},
+      },
+      macos: {
+        backgroundColor: {semantic: 'underPageBackgroundColor'},
+      },
+      default: {
+        backgroundColor: '#e9eaed',
+      },
+    }),
     flex: 1,
   },
   spacer: {
