diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/RNTesterPage.js b/E:/github/fb-react-native-forpatch/RNTester/js/RNTesterPage.js
index e5f18e1f7..6b1b0fe1d 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/RNTesterPage.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/RNTesterPage.js
@@ -11,7 +11,6 @@
 'use strict';
 
 const React = require('react');
-import Platform from '../../Libraries/Utilities/Platform'; // TODO(OSS Candidate ISS#2710739)
 const {ScrollView, StyleSheet, View} = require('react-native');
 
 const RNTesterTitle = require('./RNTesterTitle');
@@ -53,17 +52,7 @@ class RNTesterPage extends React.Component<Props> {
 
 const styles = StyleSheet.create({
   container: {
-    ...Platform.select({
-      ios: {
-        backgroundColor: {semantic: 'secondarySystemBackgroundColor'},
-      },
-      macos: {
-        backgroundColor: {semantic: 'underPageBackgroundColor'},
-      },
-      default: {
-        backgroundColor: '#e9eaed',
-      },
-    }),
+    backgroundColor: '#e9eaed',
     flex: 1,
   },
   spacer: {
