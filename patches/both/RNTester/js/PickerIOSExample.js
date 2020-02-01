diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\PickerIOSExample.js" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\PickerIOSExample.js"
index e71e035..b15cdce 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\PickerIOSExample.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\PickerIOSExample.js"
@@ -11,7 +11,7 @@
 'use strict';
 
 const React = require('react');
-const {PickerIOS, Text, View} = require('react-native');
+const {PickerIOS, Text, View, Platform} = require('react-native');
 
 const PickerItemIOS = PickerIOS.Item;
 
@@ -152,7 +152,7 @@ class PickerStyleExample extends React.Component<{}, $FlowFixMeState> {
     return (
       <PickerIOS
         itemStyle={{
-          fontSize: 25,
+          fontSize: Platform.OS === 'macos' ? 11 : 25,
           color: 'red',
           textAlign: 'left',
           fontWeight: 'bold',
