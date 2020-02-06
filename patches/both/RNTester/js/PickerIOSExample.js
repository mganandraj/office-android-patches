--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\PickerIOSExample.js"	2020-01-30 13:55:48.080579000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\js\\PickerIOSExample.js"	2020-01-29 14:10:09.177885400 -0800
@@ -11,7 +11,7 @@
 'use strict';
 
 const React = require('react');
-const {PickerIOS, Text, View} = require('react-native');
+const {PickerIOS, Text, View, Platform} = require('react-native');
 
 const PickerItemIOS = PickerIOS.Item;
 
@@ -152,7 +152,7 @@
     return (
       <PickerIOS
         itemStyle={{
-          fontSize: 25,
+          fontSize: Platform.OS === 'macos' ? 11 : 25,
           color: 'red',
           textAlign: 'left',
           fontWeight: 'bold',
