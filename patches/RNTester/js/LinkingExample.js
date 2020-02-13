--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\LinkingExample.js"	2020-01-30 13:55:48.078610900 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\js\\LinkingExample.js"	2020-01-29 14:10:09.174888900 -0800
@@ -76,8 +76,20 @@
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
