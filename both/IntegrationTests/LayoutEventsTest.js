diff --git a/E:/github/ms-react-native-forpatch/IntegrationTests/LayoutEventsTest.js b/E:/github/fb-react-native-forpatch/IntegrationTests/LayoutEventsTest.js
index 81919b0bb..7be877f96 100644
--- a/E:/github/ms-react-native-forpatch/IntegrationTests/LayoutEventsTest.js
+++ b/E:/github/fb-react-native-forpatch/IntegrationTests/LayoutEventsTest.js
@@ -10,7 +10,6 @@
 
 'use strict';
 
-const Platform = require('Platform');
 const React = require('react');
 const ReactNative = require('react-native');
 const {Image, LayoutAnimation, StyleSheet, Text, View} = ReactNative;
@@ -52,15 +51,10 @@ class LayoutEventsTest extends React.Component<Props, State> {
 
   animateViewLayout() {
     debug('animateViewLayout invoked');
-    LayoutAnimation.configureNext(
-      Platform.OS === 'macos'
-        ? LayoutAnimation.Presets.easeInEaseOut
-        : LayoutAnimation.Presets.spring,
-      () => {
-        debug('animateViewLayout done');
-        this.checkLayout(this.addWrapText);
-      },
-    );
+    LayoutAnimation.configureNext(LayoutAnimation.Presets.spring, () => {
+      debug('animateViewLayout done');
+      this.checkLayout(this.addWrapText);
+    });
     this.setState({viewStyle: {margin: 60}});
   }
 
