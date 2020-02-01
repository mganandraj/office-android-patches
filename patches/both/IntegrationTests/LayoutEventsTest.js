diff --git "a/E:\\github\\fb-react-native-forpatch-base\\IntegrationTests\\LayoutEventsTest.js" "b/E:\\github\\ms-react-native-forpatch\\IntegrationTests\\LayoutEventsTest.js"
index 7be877f..81919b0 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\IntegrationTests\\LayoutEventsTest.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\IntegrationTests\\LayoutEventsTest.js"
@@ -10,6 +10,7 @@
 
 'use strict';
 
+const Platform = require('Platform');
 const React = require('react');
 const ReactNative = require('react-native');
 const {Image, LayoutAnimation, StyleSheet, Text, View} = ReactNative;
@@ -51,10 +52,15 @@ class LayoutEventsTest extends React.Component<Props, State> {
 
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
 
