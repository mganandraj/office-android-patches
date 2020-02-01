diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\LayoutEventsExample.js" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\LayoutEventsExample.js"
index 74a285e..6b63ba1 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\LayoutEventsExample.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\LayoutEventsExample.js"
@@ -14,6 +14,7 @@ const React = require('react');
 const {
   Image,
   LayoutAnimation,
+  Platform,
   StyleSheet,
   Text,
   View,
@@ -42,10 +43,15 @@ class LayoutEventExample extends React.Component<Props, State> {
   };
 
   animateViewLayout = () => {
-    LayoutAnimation.configureNext(LayoutAnimation.Presets.spring, () => {
-      console.log('layout animation done.');
-      this.addWrapText();
-    });
+    LayoutAnimation.configureNext(
+      Platform.OS === 'macos'
+        ? LayoutAnimation.Presets.easeInEaseOut
+        : LayoutAnimation.Presets.spring,
+      () => {
+        console.log('layout animation done.');
+        this.addWrapText();
+      },
+    );
     this.setState({
       viewStyle: {
         margin: this.state.viewStyle.margin > 20 ? 20 : 60,
