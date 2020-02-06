--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\SafeAreaView\\SafeAreaView.js"	2020-01-30 13:55:47.870574800 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\SafeAreaView\\SafeAreaView.js"	2020-01-29 14:10:08.857886000 -0800
@@ -31,7 +31,8 @@
  * limitation of the screen, such as rounded corners or camera notches (aka
  * sensor housing area on iPhone X).
  */
-if (Platform.OS === 'android') {
+if (Platform.OS !== 'ios') {
+  // TODO(macOS ISS#2323203)
   const SafeAreaView = (
     props: Props,
     forwardedRef?: ?React.Ref<typeof View>,
