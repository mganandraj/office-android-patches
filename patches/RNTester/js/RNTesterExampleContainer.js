--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RNTesterExampleContainer.js"	2020-01-30 13:55:48.083612100 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\js\\RNTesterExampleContainer.js"	2020-01-29 14:10:09.180890800 -0800
@@ -20,11 +20,21 @@
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
