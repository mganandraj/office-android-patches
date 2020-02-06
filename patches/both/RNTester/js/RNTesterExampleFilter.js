--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RNTesterExampleFilter.js"	2020-01-30 13:55:48.083612100 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\js\\RNTesterExampleFilter.js"	2020-01-29 14:10:09.180890800 -0800
@@ -10,6 +10,7 @@
 
 'use strict';
 
+import Platform from '../../Libraries/Utilities/Platform'; // TODO(macOS ISS#2323203)
 const React = require('react');
 const {StyleSheet, TextInput, View} = require('react-native');
 
@@ -72,6 +73,13 @@
             this.setState(() => ({filter: text}));
           }}
           placeholder="Search..."
+          placeholderTextColor={
+            Platform.select({
+              macos: {semantic: 'placeholderTextColor'},
+              ios: {semantic: 'placeholderTextColor'},
+              default: undefined,
+            }) /*TODO(macOS ISS#2323203)*/
+          }
           underlineColorAndroid="transparent"
           style={styles.searchTextInput}
           testID={this.props.testID}
@@ -84,12 +92,40 @@
 
 const styles = StyleSheet.create({
   searchRow: {
-    backgroundColor: '#eeeeee',
+    // [TODO(macOS ISS#2323203)
+    ...Platform.select({
+      macos: {
+        backgroundColor: {semantic: 'windowBackgroundColor'},
+      },
+      ios: {
+        backgroundColor: {semantic: 'systemGroupedBackgroundColor'},
+      },
+      default: {
+        // ]TODO(macOS ISS#2323203)
+        backgroundColor: '#eeeeee',
+      }, // [TODO(macOS ISS#2323203)
+    }), // ]TODO(macOS ISS#2323203)
     padding: 10,
   },
   searchTextInput: {
-    backgroundColor: 'white',
-    borderColor: '#cccccc',
+    // [TODO(macOS ISS#2323203)
+    ...Platform.select({
+      macos: {
+        color: {semantic: 'textColor'},
+        backgroundColor: {semantic: 'textBackgroundColor'},
+        borderColor: {semantic: 'quaternaryLabelColor'},
+      },
+      ios: {
+        color: {semantic: 'labelColor'},
+        backgroundColor: {semantic: 'secondarySystemGroupedBackgroundColor'},
+        borderColor: {semantic: 'quaternaryLabelColor'},
+      },
+      default: {
+        // ]TODO(macOS ISS#2323203)
+        backgroundColor: 'white',
+        borderColor: '#cccccc',
+      }, // [TODO(macOS ISS#2323203)
+    }), // ]TODO(macOS ISS#2323203)
     borderRadius: 3,
     borderWidth: 1,
     paddingLeft: 8,
