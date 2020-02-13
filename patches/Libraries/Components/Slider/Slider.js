--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Slider\\Slider.js"	2020-01-30 13:55:47.874608300 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Slider\\Slider.js"	2020-01-29 14:10:08.863882800 -0800
@@ -255,7 +255,10 @@
 };
 
 let styles;
-if (Platform.OS === 'ios') {
+if (
+  Platform.OS === 'ios' ||
+  Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
+) {
   styles = StyleSheet.create({
     slider: {
       height: 40,
