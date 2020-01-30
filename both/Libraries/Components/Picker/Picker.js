diff --git a/E:/github/ms-react-native-forpatch/Libraries/Components/Picker/Picker.js b/E:/github/fb-react-native-forpatch/Libraries/Components/Picker/Picker.js
index c3147754d..535398695 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Components/Picker/Picker.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Components/Picker/Picker.js
@@ -135,10 +135,7 @@ class Picker extends React.Component<PickerProps> {
   };
 
   render() {
-    if (
-      Platform.OS === 'ios' ||
-      Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
-    ) {
+    if (Platform.OS === 'ios') {
       /* $FlowFixMe(>=0.81.0 site=react_native_ios_fb) This suppression was
        * added when renaming suppression sites. */
       return <PickerIOS {...this.props}>{this.props.children}</PickerIOS>;
