diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/LayoutEventsExample.js b/E:/github/fb-react-native-forpatch/RNTester/js/LayoutEventsExample.js
index 6b63ba14c..74a285e25 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/LayoutEventsExample.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/LayoutEventsExample.js
@@ -14,7 +14,6 @@ const React = require('react');
 const {
   Image,
   LayoutAnimation,
-  Platform,
   StyleSheet,
   Text,
   View,
@@ -43,15 +42,10 @@ class LayoutEventExample extends React.Component<Props, State> {
   };
 
   animateViewLayout = () => {
-    LayoutAnimation.configureNext(
-      Platform.OS === 'macos'
-        ? LayoutAnimation.Presets.easeInEaseOut
-        : LayoutAnimation.Presets.spring,
-      () => {
-        console.log('layout animation done.');
-        this.addWrapText();
-      },
-    );
+    LayoutAnimation.configureNext(LayoutAnimation.Presets.spring, () => {
+      console.log('layout animation done.');
+      this.addWrapText();
+    });
     this.setState({
       viewStyle: {
         margin: this.state.viewStyle.margin > 20 ? 20 : 60,
