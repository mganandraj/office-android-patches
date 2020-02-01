diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RNTesterExampleContainer.js" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\RNTesterExampleContainer.js"
index 9b66083..f2ffcb7 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RNTesterExampleContainer.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\RNTesterExampleContainer.js"
@@ -20,11 +20,21 @@ class RNTesterExampleContainer extends React.Component {
     // Filter platform-specific examples
     const {description, platform} = example;
     let {title} = example;
+    let platformSupported;
     if (platform) {
-      if (Platform.OS !== platform) {
-        return null;
+      if (Array.isArray(platform)) {
+        if (!platform.includes(Platform.OS)) {
+          return null;
+        }
+        platformSupported = platform.join(' & ');
+      } else {
+        if (Platform.OS !== platform) {
+          return null;
+        }
+        platformSupported = platform;
       }
-      title += ' (' + platform + ' only)';
+
+      title += ' (' + platformSupported + ' only)';
     }
     return (
       <RNTesterBlock key={i} title={title} description={description}>
