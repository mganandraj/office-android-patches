--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RNTesterPage.js"	2020-01-30 13:55:48.084616100 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\js\\RNTesterPage.js"	2020-01-29 14:10:09.182888100 -0800
@@ -11,6 +11,7 @@
 'use strict';
 
 const React = require('react');
+import Platform from '../../Libraries/Utilities/Platform'; // TODO(OSS Candidate ISS#2710739)
 const {ScrollView, StyleSheet, View} = require('react-native');
 
 const RNTesterTitle = require('./RNTesterTitle');
@@ -52,7 +53,17 @@
 
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
