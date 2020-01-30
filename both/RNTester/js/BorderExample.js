diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/BorderExample.js b/E:/github/fb-react-native-forpatch/RNTester/js/BorderExample.js
index 193c6678f..f43016ef6 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/BorderExample.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/BorderExample.js
@@ -216,7 +216,7 @@ exports.examples = [
   {
     title: 'Custom Borders',
     description: 'border*Width & border*Color',
-    platform: ['ios', 'macos'],
+    platform: 'ios',
     render() {
       return <View style={[styles.box, styles.border5]} />;
     },
@@ -224,7 +224,7 @@ exports.examples = [
   {
     title: 'Custom Borders',
     description: 'border*Width & border*Color',
-    platform: ['ios', 'macos'],
+    platform: 'ios',
     render() {
       return <View style={[styles.box, styles.border6]} />;
     },
@@ -232,7 +232,7 @@ exports.examples = [
   {
     title: 'Custom Borders',
     description: 'borderRadius & clipping',
-    platform: ['ios', 'macos'],
+    platform: 'ios',
     render() {
       return (
         <View style={[styles.box, styles.border7]}>
