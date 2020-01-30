diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/RNTesterApp.android.js b/E:/github/fb-react-native-forpatch/RNTester/js/RNTesterApp.android.js
index f8258faaf..d3b291522 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/RNTesterApp.android.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/RNTesterApp.android.js
@@ -124,8 +124,6 @@ class RNTesterApp extends React.Component<Props, RNTesterNavigationState> {
   _renderDrawerContent = () => {
     return (
       <View style={styles.drawerContentWrapper}>
-        {/* $FlowFixMe(>=0.78.0 site=react_native_android_fb) This issue was
-         * found when making Flow check .android.js files. */}
         <RNTesterExampleList
           list={RNTesterList}
           displayTitleRow={true}
@@ -190,8 +188,6 @@ class RNTesterApp extends React.Component<Props, RNTesterNavigationState> {
           style={styles.toolbar}
           title="RNTester"
         />
-        {/* $FlowFixMe(>=0.78.0 site=react_native_android_fb) This issue was
-         * found when making Flow check .android.js files. */}
         <RNTesterExampleList
           onNavigate={this._handleAction}
           list={RNTesterList}
