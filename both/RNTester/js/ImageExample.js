diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/ImageExample.js b/E:/github/fb-react-native-forpatch/RNTester/js/ImageExample.js
index 772f6a147..82cfc8b5c 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/ImageExample.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/ImageExample.js
@@ -469,7 +469,7 @@ exports.examples = [
         />
       );
     },
-    platform: ['ios', 'macos'],
+    platform: 'ios',
   },
   {
     title: 'Image Download Progress',
@@ -482,7 +482,7 @@ exports.examples = [
         />
       );
     },
-    platform: ['ios', 'macos'],
+    platform: 'ios',
   },
   {
     title: 'defaultSource',
@@ -498,7 +498,7 @@ exports.examples = [
         />
       );
     },
-    platform: ['ios', 'macos'],
+    platform: 'ios',
   },
   {
     title: 'Cache Policy',
@@ -528,9 +528,8 @@ exports.examples = [
         </View>
       );
     },
-    platform: ['ios', 'macos'],
+    platform: 'ios',
   },
-
   {
     title: 'Border Color',
     render: function() {
@@ -840,7 +839,7 @@ exports.examples = [
         />
       );
     },
-    platform: ['ios', 'macos'],
+    platform: 'ios',
   },
   {
     title: 'Base64 image',
@@ -849,7 +848,7 @@ exports.examples = [
         <Image style={styles.base64} source={{uri: base64Icon, scale: 3}} />
       );
     },
-    platform: ['ios', 'macos'],
+    platform: 'ios',
   },
   {
     title: 'Cap Insets',
@@ -861,7 +860,7 @@ exports.examples = [
     render: function() {
       return <ImageCapInsetsExample />;
     },
-    platform: ['ios', 'macos'],
+    platform: 'ios',
   },
   {
     title: 'Image Size',
@@ -916,35 +915,6 @@ exports.examples = [
     },
     platform: 'ios',
   },
-  {
-    title: 'Bundled images',
-    description: 'Images shipped in a separate native bundle',
-    render: function() {
-      return (
-        <View style={{flexDirection: 'row'}}>
-          <Image
-            source={{
-              uri: 'ImageInBundle',
-              bundle: 'RNTesterBundle-macOS',
-              width: 100,
-              height: 100,
-            }}
-            style={{borderColor: 'yellow', borderWidth: 4}}
-          />
-          <Image
-            source={{
-              uri: 'ImageInAssetCatalog',
-              bundle: 'RNTesterBundle-macOS',
-              width: 100,
-              height: 100,
-            }}
-            style={{marginLeft: 10, borderColor: 'blue', borderWidth: 4}}
-          />
-        </View>
-      );
-    },
-    platform: 'macos',
-  },
   {
     title: 'Blur Radius',
     render: function() {
