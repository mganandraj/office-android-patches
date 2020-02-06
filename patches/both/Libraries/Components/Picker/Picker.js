--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Components\\Picker\\Picker.js"	2020-01-30 13:55:47.864606900 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Components\\Picker\\Picker.js"	2020-01-29 14:10:08.844882700 -0800
@@ -135,7 +135,10 @@
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
