diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\LinkingExample.js" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\LinkingExample.js"
index 32ae2bc..2b571bf 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\LinkingExample.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\LinkingExample.js"
@@ -76,8 +76,20 @@ class IntentAndroidExample extends React.Component {
           <OpenURLButton url={'https://www.facebook.com'} />
           <OpenURLButton url={'http://www.facebook.com'} />
           <OpenURLButton url={'http://facebook.com'} />
-          <OpenURLButton url={'fb://notifications'} />
-          <OpenURLButton url={'geo:37.484847,-122.148386'} />
+          <OpenURLButton
+            url={
+              Platform.OS === 'macos'
+                ? 'mailto:mark@facebook.com'
+                : 'fb://notifications'
+            }
+          />
+          <OpenURLButton
+            url={
+              Platform.OS === 'macos'
+                ? 'maps:ll=45.5200,-122.681'
+                : 'geo:37.484847,-122.148386'
+            }
+          />
           <OpenURLButton url={'tel:9876543210'} />
         </RNTesterBlock>
         {Platform.OS === 'android' && (
