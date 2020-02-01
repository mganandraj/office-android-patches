diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RNTesterApp.android.js" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\RNTesterApp.android.js"
index d3b2915..f8258fa 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RNTesterApp.android.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\RNTesterApp.android.js"
@@ -124,6 +124,8 @@ class RNTesterApp extends React.Component<Props, RNTesterNavigationState> {
   _renderDrawerContent = () => {
     return (
       <View style={styles.drawerContentWrapper}>
+        {/* $FlowFixMe(>=0.78.0 site=react_native_android_fb) This issue was
+         * found when making Flow check .android.js files. */}
         <RNTesterExampleList
           list={RNTesterList}
           displayTitleRow={true}
@@ -188,6 +190,8 @@ class RNTesterApp extends React.Component<Props, RNTesterNavigationState> {
           style={styles.toolbar}
           title="RNTester"
         />
+        {/* $FlowFixMe(>=0.78.0 site=react_native_android_fb) This issue was
+         * found when making Flow check .android.js files. */}
         <RNTesterExampleList
           onNavigate={this._handleAction}
           list={RNTesterList}
