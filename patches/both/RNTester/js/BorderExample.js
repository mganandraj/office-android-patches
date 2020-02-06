--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\BorderExample.js"	2020-01-30 13:55:48.074612200 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\js\\BorderExample.js"	2020-01-29 14:10:09.166884700 -0800
@@ -216,7 +216,7 @@
   {
     title: 'Custom Borders',
     description: 'border*Width & border*Color',
-    platform: 'ios',
+    platform: ['ios', 'macos'],
     render() {
       return <View style={[styles.box, styles.border5]} />;
     },
@@ -224,7 +224,7 @@
   {
     title: 'Custom Borders',
     description: 'border*Width & border*Color',
-    platform: 'ios',
+    platform: ['ios', 'macos'],
     render() {
       return <View style={[styles.box, styles.border6]} />;
     },
@@ -232,7 +232,7 @@
   {
     title: 'Custom Borders',
     description: 'borderRadius & clipping',
-    platform: 'ios',
+    platform: ['ios', 'macos'],
     render() {
       return (
         <View style={[styles.box, styles.border7]}>
