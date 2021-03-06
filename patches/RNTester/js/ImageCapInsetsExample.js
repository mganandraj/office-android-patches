--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\ImageCapInsetsExample.js"	2020-01-30 13:55:48.076612100 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\js\\ImageCapInsetsExample.js"	2020-01-29 14:10:09.171888600 -0800
@@ -12,6 +12,7 @@
 
 const React = require('react');
 const ReactNative = require('react-native');
+import Platform from '../../Libraries/Utilities/Platform'; // TODO(OSS Candidate ISS#2710739)
 
 const nativeImageSource = require('../../Libraries/Image/nativeImageSource');
 const {Image, StyleSheet, Text, View} = ReactNative;
@@ -19,16 +20,27 @@
 type Props = $ReadOnly<{||}>;
 class ImageCapInsetsExample extends React.Component<Props> {
   render() {
+    let nativeImage;
+    if (Platform.OS === 'macos') {
+      nativeImage = nativeImageSource({
+        macos: 'story-background',
+        width: 60,
+        height: 60,
+      });
+    } else {
+      nativeImage = nativeImageSource({
+        ios: 'story-background',
+        width: 60,
+        height: 60,
+      });
+    }
+
     return (
       <View>
         <View style={styles.background}>
           <Text>capInsets: none</Text>
           <Image
-            source={nativeImageSource({
-              ios: 'story-background',
-              width: 60,
-              height: 60,
-            })}
+            source={nativeImage}
             style={styles.storyBackground}
             resizeMode="stretch"
             capInsets={{left: 0, right: 0, bottom: 0, top: 0}}
@@ -37,11 +49,7 @@
         <View style={[styles.background, {paddingTop: 10}]}>
           <Text>capInsets: 15</Text>
           <Image
-            source={nativeImageSource({
-              ios: 'story-background',
-              width: 60,
-              height: 60,
-            })}
+            source={nativeImage}
             style={styles.storyBackground}
             resizeMode="stretch"
             capInsets={{left: 15, right: 15, bottom: 15, top: 15}}
