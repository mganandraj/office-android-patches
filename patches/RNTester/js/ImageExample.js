--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\ImageExample.js"	2020-01-30 13:55:48.077612500 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\js\\ImageExample.js"	2020-01-29 14:10:09.172888200 -0800
@@ -469,7 +469,7 @@
         />
       );
     },
-    platform: 'ios',
+    platform: ['ios', 'macos'],
   },
   {
     title: 'Image Download Progress',
@@ -482,7 +482,7 @@
         />
       );
     },
-    platform: 'ios',
+    platform: ['ios', 'macos'],
   },
   {
     title: 'defaultSource',
@@ -498,7 +498,7 @@
         />
       );
     },
-    platform: 'ios',
+    platform: ['ios', 'macos'],
   },
   {
     title: 'Cache Policy',
@@ -528,8 +528,9 @@
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
@@ -839,7 +840,7 @@
         />
       );
     },
-    platform: 'ios',
+    platform: ['ios', 'macos'],
   },
   {
     title: 'Base64 image',
@@ -848,7 +849,7 @@
         <Image style={styles.base64} source={{uri: base64Icon, scale: 3}} />
       );
     },
-    platform: 'ios',
+    platform: ['ios', 'macos'],
   },
   {
     title: 'Cap Insets',
@@ -860,7 +861,7 @@
     render: function() {
       return <ImageCapInsetsExample />;
     },
-    platform: 'ios',
+    platform: ['ios', 'macos'],
   },
   {
     title: 'Image Size',
@@ -916,6 +917,35 @@
     platform: 'ios',
   },
   {
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
+  {
     title: 'Blur Radius',
     render: function() {
       return (
