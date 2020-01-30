diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/ImageCapInsetsExample.js b/E:/github/fb-react-native-forpatch/RNTester/js/ImageCapInsetsExample.js
index f047672e0..ca95d454e 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/ImageCapInsetsExample.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/ImageCapInsetsExample.js
@@ -12,7 +12,6 @@
 
 const React = require('react');
 const ReactNative = require('react-native');
-import Platform from '../../Libraries/Utilities/Platform'; // TODO(OSS Candidate ISS#2710739)
 
 const nativeImageSource = require('../../Libraries/Image/nativeImageSource');
 const {Image, StyleSheet, Text, View} = ReactNative;
@@ -20,27 +19,16 @@ const {Image, StyleSheet, Text, View} = ReactNative;
 type Props = $ReadOnly<{||}>;
 class ImageCapInsetsExample extends React.Component<Props> {
   render() {
-    let nativeImage;
-    if (Platform.OS === 'macos') {
-      nativeImage = nativeImageSource({
-        macos: 'story-background',
-        width: 60,
-        height: 60,
-      });
-    } else {
-      nativeImage = nativeImageSource({
-        ios: 'story-background',
-        width: 60,
-        height: 60,
-      });
-    }
-
     return (
       <View>
         <View style={styles.background}>
           <Text>capInsets: none</Text>
           <Image
-            source={nativeImage}
+            source={nativeImageSource({
+              ios: 'story-background',
+              width: 60,
+              height: 60,
+            })}
             style={styles.storyBackground}
             resizeMode="stretch"
             capInsets={{left: 0, right: 0, bottom: 0, top: 0}}
@@ -49,7 +37,11 @@ class ImageCapInsetsExample extends React.Component<Props> {
         <View style={[styles.background, {paddingTop: 10}]}>
           <Text>capInsets: 15</Text>
           <Image
-            source={nativeImage}
+            source={nativeImageSource({
+              ios: 'story-background',
+              width: 60,
+              height: 60,
+            })}
             style={styles.storyBackground}
             resizeMode="stretch"
             capInsets={{left: 15, right: 15, bottom: 15, top: 15}}
