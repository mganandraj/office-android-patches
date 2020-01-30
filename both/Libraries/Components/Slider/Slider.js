diff --git a/E:/github/ms-react-native-forpatch/Libraries/Components/Slider/Slider.js b/E:/github/fb-react-native-forpatch/Libraries/Components/Slider/Slider.js
index 618a14903..e0e22b335 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Components/Slider/Slider.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Components/Slider/Slider.js
@@ -255,10 +255,7 @@ SliderWithRef.defaultProps = {
 };
 
 let styles;
-if (
-  Platform.OS === 'ios' ||
-  Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
-) {
+if (Platform.OS === 'ios') {
   styles = StyleSheet.create({
     slider: {
       height: 40,
