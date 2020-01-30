diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/RTLExample.js b/E:/github/fb-react-native-forpatch/RNTester/js/RTLExample.js
index c8e2964dd..38462ee5b 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/RTLExample.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/RTLExample.js
@@ -519,9 +519,7 @@ const BorderExample = withRTLState(({isRTL, setRTL}) => {
 });
 
 const directionStyle = isRTL =>
-  Platform.OS === 'ios' || Platform.OS === 'macos'
-    ? {direction: isRTL ? 'rtl' : 'ltr'}
-    : null;
+  Platform.OS === 'ios' ? {direction: isRTL ? 'rtl' : 'ltr'} : null;
 
 const styles = StyleSheet.create({
   container: {
@@ -660,7 +658,7 @@ exports.examples = [
   {
     title: 'Default Text Alignment',
     description:
-      'In iOS/macOS, it depends on active language. ' +
+      'In iOS, it depends on active language. ' +
       'In Android, it depends on the text content.',
     render: function(): React.Element<any> {
       return <TextAlignmentExample style={styles.fontSizeSmall} />;
@@ -669,7 +667,7 @@ exports.examples = [
   {
     title: "Using textAlign: 'left'",
     description:
-      'In iOS/macOS/Android, text alignment flips regardless of ' +
+      'In iOS/Android, text alignment flips regardless of ' +
       'languages or text content.',
     render: function(): React.Element<any> {
       return (
@@ -682,7 +680,7 @@ exports.examples = [
   {
     title: "Using textAlign: 'right'",
     description:
-      'In iOS/macOS/Android, text alignment flips regardless of ' +
+      'In iOS/Android, text alignment flips regardless of ' +
       'languages or text content.',
     render: function(): React.Element<any> {
       return (
