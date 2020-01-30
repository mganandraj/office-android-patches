diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/PickerIOSExample.js b/E:/github/fb-react-native-forpatch/RNTester/js/PickerIOSExample.js
index b15cdce74..e71e03539 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/PickerIOSExample.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/PickerIOSExample.js
@@ -11,7 +11,7 @@
 'use strict';
 
 const React = require('react');
-const {PickerIOS, Text, View, Platform} = require('react-native');
+const {PickerIOS, Text, View} = require('react-native');
 
 const PickerItemIOS = PickerIOS.Item;
 
@@ -152,7 +152,7 @@ class PickerStyleExample extends React.Component<{}, $FlowFixMeState> {
     return (
       <PickerIOS
         itemStyle={{
-          fontSize: Platform.OS === 'macos' ? 11 : 25,
+          fontSize: 25,
           color: 'red',
           textAlign: 'left',
           fontWeight: 'bold',
