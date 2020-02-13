--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\ActivityIndicatorExample.js"	2020-01-30 13:55:48.070608900 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\js\\ActivityIndicatorExample.js"	2020-01-29 14:10:09.160885800 -0800
@@ -12,6 +12,7 @@
 
 import React, {Component} from 'react';
 import {ActivityIndicator, StyleSheet, View} from 'react-native';
+import Platform from '../../Libraries/Utilities/Platform'; // TODO(OSS Candidate ISS#2710739)
 
 type State = {|animating: boolean|};
 type Props = $ReadOnly<{||}>;
@@ -66,6 +67,14 @@
     flexDirection: 'row',
     justifyContent: 'space-around',
     padding: 8,
+    ...Platform.select({
+      macos: {
+        backgroundColor: {semantic: 'windowBackgroundColor'},
+      },
+      default: {
+        backgroundColor: undefined,
+      },
+    }),
   },
 });
 
@@ -102,8 +111,18 @@
     render() {
       return (
         <View style={styles.horizontal}>
-          <ActivityIndicator color="#0000ff" />
-          <ActivityIndicator color="#aa00aa" />
+          <ActivityIndicator
+            color={
+              Platform.OS === 'macos'
+                ? {dynamic: {light: 'black', dark: 'white'}}
+                : '#0000ff'
+            }
+          />
+          <ActivityIndicator
+            color={
+              Platform.OS === 'macos' ? {semantic: 'textColor'} : '#aa00aa'
+            }
+          />
           <ActivityIndicator color="#aa3300" />
           <ActivityIndicator color="#00aa00" />
         </View>
@@ -142,6 +161,19 @@
     },
   },
   {
+    platform: 'ios',
+    title: 'Custom size',
+    render() {
+      return (
+        <ActivityIndicator
+          style={[styles.centering, {transform: [{scale: 1.5}]}]}
+          size="large"
+        />
+      );
+    },
+  },
+  {
+    platform: 'android',
     title: 'Custom size',
     render() {
       return (
