diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\SafeAreaView\\SafeAreaView.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\SafeAreaView\\SafeAreaView.js"
index b9c157d..55a226d 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\SafeAreaView\\SafeAreaView.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\SafeAreaView\\SafeAreaView.js"
@@ -31,7 +31,8 @@ let exported;
  * limitation of the screen, such as rounded corners or camera notches (aka
  * sensor housing area on iPhone X).
  */
-if (Platform.OS === 'android') {
+if (Platform.OS !== 'ios') {
+  // TODO(macOS ISS#2323203)
   const SafeAreaView = (
     props: Props,
     forwardedRef?: ?React.Ref<typeof View>,
