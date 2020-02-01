diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\ImageExample.js" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\ImageExample.js"
index 82cfc8b..772f6a1 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\ImageExample.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\ImageExample.js"
@@ -469,7 +469,7 @@ exports.examples = [
         />
       );
     },
-    platform: 'ios',
+    platform: ['ios', 'macos'],
   },
   {
     title: 'Image Download Progress',
@@ -482,7 +482,7 @@ exports.examples = [
         />
       );
     },
-    platform: 'ios',
+    platform: ['ios', 'macos'],
   },
   {
     title: 'defaultSource',
@@ -498,7 +498,7 @@ exports.examples = [
         />
       );
     },
-    platform: 'ios',
+    platform: ['ios', 'macos'],
   },
   {
     title: 'Cache Policy',
@@ -528,8 +528,9 @@ exports.examples = [
         </View>
       );
     },
-    platform: 'ios',
+    platform: ['ios', 'macos'],
   },
+
   {
     title: 'Border Color',
     render: function() {
@@ -839,7 +840,7 @@ exports.examples = [
         />
       );
     },
-    platform: 'ios',
+    platform: ['ios', 'macos'],
   },
   {
     title: 'Base64 image',
@@ -848,7 +849,7 @@ exports.examples = [
         <Image style={styles.base64} source={{uri: base64Icon, scale: 3}} />
       );
     },
-    platform: 'ios',
+    platform: ['ios', 'macos'],
   },
   {
     title: 'Cap Insets',
@@ -860,7 +861,7 @@ exports.examples = [
     render: function() {
       return <ImageCapInsetsExample />;
     },
-    platform: 'ios',
+    platform: ['ios', 'macos'],
   },
   {
     title: 'Image Size',
@@ -915,6 +916,35 @@ exports.examples = [
     },
     platform: 'ios',
   },
+  {
+    title: 'Bundled images',
+    description: 'Images shipped in a separate native bundle',
+    render: function() {
+      return (
+        <View style={{flexDirection: 'row'}}>
+          <Image
+            source={{
+              uri: 'ImageInBundle',
+              bundle: 'RNTesterBundle-macOS',
+              width: 100,
+              height: 100,
+            }}
+            style={{borderColor: 'yellow', borderWidth: 4}}
+          />
+          <Image
+            source={{
+              uri: 'ImageInAssetCatalog',
+              bundle: 'RNTesterBundle-macOS',
+              width: 100,
+              height: 100,
+            }}
+            style={{marginLeft: 10, borderColor: 'blue', borderWidth: 4}}
+          />
+        </View>
+      );
+    },
+    platform: 'macos',
+  },
   {
     title: 'Blur Radius',
     render: function() {
