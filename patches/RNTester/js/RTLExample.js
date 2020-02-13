--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RTLExample.js"	2020-01-30 13:55:48.085620400 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\js\\RTLExample.js"	2020-01-29 14:10:09.183885400 -0800
@@ -519,7 +519,9 @@
 });
 
 const directionStyle = isRTL =>
-  Platform.OS === 'ios' ? {direction: isRTL ? 'rtl' : 'ltr'} : null;
+  Platform.OS === 'ios' || Platform.OS === 'macos'
+    ? {direction: isRTL ? 'rtl' : 'ltr'}
+    : null;
 
 const styles = StyleSheet.create({
   container: {
@@ -658,7 +660,7 @@
   {
     title: 'Default Text Alignment',
     description:
-      'In iOS, it depends on active language. ' +
+      'In iOS/macOS, it depends on active language. ' +
       'In Android, it depends on the text content.',
     render: function(): React.Element<any> {
       return <TextAlignmentExample style={styles.fontSizeSmall} />;
@@ -667,7 +669,7 @@
   {
     title: "Using textAlign: 'left'",
     description:
-      'In iOS/Android, text alignment flips regardless of ' +
+      'In iOS/macOS/Android, text alignment flips regardless of ' +
       'languages or text content.',
     render: function(): React.Element<any> {
       return (
@@ -680,7 +682,7 @@
   {
     title: "Using textAlign: 'right'",
     description:
-      'In iOS/Android, text alignment flips regardless of ' +
+      'In iOS/macOS/Android, text alignment flips regardless of ' +
       'languages or text content.',
     render: function(): React.Element<any> {
       return (
