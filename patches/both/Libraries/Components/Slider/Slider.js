diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Slider\\Slider.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Slider\\Slider.js"
index e0e22b3..618a149 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Slider\\Slider.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Slider\\Slider.js"
@@ -255,7 +255,10 @@ SliderWithRef.defaultProps = {
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
