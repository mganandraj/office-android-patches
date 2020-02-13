--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\LayoutEventsExample.js"	2020-01-30 13:55:48.077612500 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\js\\LayoutEventsExample.js"	2020-01-29 14:10:09.173886200 -0800
@@ -14,6 +14,7 @@
 const {
   Image,
   LayoutAnimation,
+  Platform,
   StyleSheet,
   Text,
   View,
@@ -42,10 +43,15 @@
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
