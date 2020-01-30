diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/LinkingExample.js b/E:/github/fb-react-native-forpatch/RNTester/js/LinkingExample.js
index 2b571bfb0..32ae2bc99 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/LinkingExample.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/LinkingExample.js
@@ -76,20 +76,8 @@ class IntentAndroidExample extends React.Component {
           <OpenURLButton url={'https://www.facebook.com'} />
           <OpenURLButton url={'http://www.facebook.com'} />
           <OpenURLButton url={'http://facebook.com'} />
-          <OpenURLButton
-            url={
-              Platform.OS === 'macos'
-                ? 'mailto:mark@facebook.com'
-                : 'fb://notifications'
-            }
-          />
-          <OpenURLButton
-            url={
-              Platform.OS === 'macos'
-                ? 'maps:ll=45.5200,-122.681'
-                : 'geo:37.484847,-122.148386'
-            }
-          />
+          <OpenURLButton url={'fb://notifications'} />
+          <OpenURLButton url={'geo:37.484847,-122.148386'} />
           <OpenURLButton url={'tel:9876543210'} />
         </RNTesterBlock>
         {Platform.OS === 'android' && (
