diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Picker\\Picker.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Picker\\Picker.js"
index 5353986..c314775 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Picker\\Picker.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Picker\\Picker.js"
@@ -135,7 +135,10 @@ class Picker extends React.Component<PickerProps> {
   };
 
   render() {
-    if (Platform.OS === 'ios') {
+    if (
+      Platform.OS === 'ios' ||
+      Platform.OS === 'macos' /* TODO(macOS ISS#2323203) */
+    ) {
       /* $FlowFixMe(>=0.81.0 site=react_native_ios_fb) This suppression was
        * added when renaming suppression sites. */
       return <PickerIOS {...this.props}>{this.props.children}</PickerIOS>;
