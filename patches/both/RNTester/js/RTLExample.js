diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RTLExample.js" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\RTLExample.js"
index 38462ee..c8e2964 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RTLExample.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\RTLExample.js"
@@ -519,7 +519,9 @@ const BorderExample = withRTLState(({isRTL, setRTL}) => {
 });
 
 const directionStyle = isRTL =>
-  Platform.OS === 'ios' ? {direction: isRTL ? 'rtl' : 'ltr'} : null;
+  Platform.OS === 'ios' || Platform.OS === 'macos'
+    ? {direction: isRTL ? 'rtl' : 'ltr'}
+    : null;
 
 const styles = StyleSheet.create({
   container: {
@@ -658,7 +660,7 @@ exports.examples = [
   {
     title: 'Default Text Alignment',
     description:
-      'In iOS, it depends on active language. ' +
+      'In iOS/macOS, it depends on active language. ' +
       'In Android, it depends on the text content.',
     render: function(): React.Element<any> {
       return <TextAlignmentExample style={styles.fontSizeSmall} />;
@@ -667,7 +669,7 @@ exports.examples = [
   {
     title: "Using textAlign: 'left'",
     description:
-      'In iOS/Android, text alignment flips regardless of ' +
+      'In iOS/macOS/Android, text alignment flips regardless of ' +
       'languages or text content.',
     render: function(): React.Element<any> {
       return (
@@ -680,7 +682,7 @@ exports.examples = [
   {
     title: "Using textAlign: 'right'",
     description:
-      'In iOS/Android, text alignment flips regardless of ' +
+      'In iOS/macOS/Android, text alignment flips regardless of ' +
       'languages or text content.',
     render: function(): React.Element<any> {
       return (
