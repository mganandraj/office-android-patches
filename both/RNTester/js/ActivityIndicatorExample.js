diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/ActivityIndicatorExample.js b/E:/github/fb-react-native-forpatch/RNTester/js/ActivityIndicatorExample.js
index 5341f4be4..ca25a457a 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/ActivityIndicatorExample.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/ActivityIndicatorExample.js
@@ -12,7 +12,6 @@
 
 import React, {Component} from 'react';
 import {ActivityIndicator, StyleSheet, View} from 'react-native';
-import Platform from '../../Libraries/Utilities/Platform'; // TODO(OSS Candidate ISS#2710739)
 
 type State = {|animating: boolean|};
 type Props = $ReadOnly<{||}>;
@@ -67,14 +66,6 @@ const styles = StyleSheet.create({
     flexDirection: 'row',
     justifyContent: 'space-around',
     padding: 8,
-    ...Platform.select({
-      macos: {
-        backgroundColor: {semantic: 'windowBackgroundColor'},
-      },
-      default: {
-        backgroundColor: undefined,
-      },
-    }),
   },
 });
 
@@ -111,18 +102,8 @@ exports.examples = [
     render() {
       return (
         <View style={styles.horizontal}>
-          <ActivityIndicator
-            color={
-              Platform.OS === 'macos'
-                ? {dynamic: {light: 'black', dark: 'white'}}
-                : '#0000ff'
-            }
-          />
-          <ActivityIndicator
-            color={
-              Platform.OS === 'macos' ? {semantic: 'textColor'} : '#aa00aa'
-            }
-          />
+          <ActivityIndicator color="#0000ff" />
+          <ActivityIndicator color="#aa00aa" />
           <ActivityIndicator color="#aa3300" />
           <ActivityIndicator color="#00aa00" />
         </View>
@@ -161,19 +142,6 @@ exports.examples = [
     },
   },
   {
-    platform: 'ios',
-    title: 'Custom size',
-    render() {
-      return (
-        <ActivityIndicator
-          style={[styles.centering, {transform: [{scale: 1.5}]}]}
-          size="large"
-        />
-      );
-    },
-  },
-  {
-    platform: 'android',
     title: 'Custom size',
     render() {
       return (
