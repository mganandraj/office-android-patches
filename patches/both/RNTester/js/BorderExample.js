diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\BorderExample.js" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\BorderExample.js"
index f43016e..193c667 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\BorderExample.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\BorderExample.js"
@@ -216,7 +216,7 @@ exports.examples = [
   {
     title: 'Custom Borders',
     description: 'border*Width & border*Color',
-    platform: 'ios',
+    platform: ['ios', 'macos'],
     render() {
       return <View style={[styles.box, styles.border5]} />;
     },
@@ -224,7 +224,7 @@ exports.examples = [
   {
     title: 'Custom Borders',
     description: 'border*Width & border*Color',
-    platform: 'ios',
+    platform: ['ios', 'macos'],
     render() {
       return <View style={[styles.box, styles.border6]} />;
     },
@@ -232,7 +232,7 @@ exports.examples = [
   {
     title: 'Custom Borders',
     description: 'borderRadius & clipping',
-    platform: 'ios',
+    platform: ['ios', 'macos'],
     render() {
       return (
         <View style={[styles.box, styles.border7]}>
