--- "E:\\github\\fb-react-native-forpatch-base\\IntegrationTests\\LayoutEventsTest.js"	2020-01-30 13:55:47.809606400 -0800
+++ "E:\\github\\ms-react-native-forpatch\\IntegrationTests\\LayoutEventsTest.js"	2020-01-29 14:10:08.789911700 -0800
@@ -10,6 +10,7 @@
 
 'use strict';
 
+const Platform = require('Platform');
 const React = require('react');
 const ReactNative = require('react-native');
 const {Image, LayoutAnimation, StyleSheet, Text, View} = ReactNative;
@@ -51,10 +52,15 @@
 
   animateViewLayout() {
     debug('animateViewLayout invoked');
-    LayoutAnimation.configureNext(LayoutAnimation.Presets.spring, () => {
-      debug('animateViewLayout done');
-      this.checkLayout(this.addWrapText);
-    });
+    LayoutAnimation.configureNext(
+      Platform.OS === 'macos'
+        ? LayoutAnimation.Presets.easeInEaseOut
+        : LayoutAnimation.Presets.spring,
+      () => {
+        debug('animateViewLayout done');
+        this.checkLayout(this.addWrapText);
+      },
+    );
     this.setState({viewStyle: {margin: 60}});
   }
 
