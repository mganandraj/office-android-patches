diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/RNTesterExampleContainer.js b/E:/github/fb-react-native-forpatch/RNTester/js/RNTesterExampleContainer.js
index f2ffcb740..9b660832f 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/RNTesterExampleContainer.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/RNTesterExampleContainer.js
@@ -20,21 +20,11 @@ class RNTesterExampleContainer extends React.Component {
     // Filter platform-specific examples
     const {description, platform} = example;
     let {title} = example;
-    let platformSupported;
     if (platform) {
-      if (Array.isArray(platform)) {
-        if (!platform.includes(Platform.OS)) {
-          return null;
-        }
-        platformSupported = platform.join(' & ');
-      } else {
-        if (Platform.OS !== platform) {
-          return null;
-        }
-        platformSupported = platform;
+      if (Platform.OS !== platform) {
+        return null;
       }
-
-      title += ' (' + platformSupported + ' only)';
+      title += ' (' + platform + ' only)';
     }
     return (
       <RNTesterBlock key={i} title={title} description={description}>
