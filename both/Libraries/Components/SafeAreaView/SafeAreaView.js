diff --git a/E:/github/ms-react-native-forpatch/Libraries/Components/SafeAreaView/SafeAreaView.js b/E:/github/fb-react-native-forpatch/Libraries/Components/SafeAreaView/SafeAreaView.js
index 55a226d76..b9c157df9 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Components/SafeAreaView/SafeAreaView.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Components/SafeAreaView/SafeAreaView.js
@@ -31,8 +31,7 @@ let exported;
  * limitation of the screen, such as rounded corners or camera notches (aka
  * sensor housing area on iPhone X).
  */
-if (Platform.OS !== 'ios') {
-  // TODO(macOS ISS#2323203)
+if (Platform.OS === 'android') {
   const SafeAreaView = (
     props: Props,
     forwardedRef?: ?React.Ref<typeof View>,
