--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\RNTesterApp.android.js"	2020-01-30 13:55:48.082577300 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\js\\RNTesterApp.android.js"	2020-01-29 14:10:09.179886200 -0800
@@ -124,6 +124,8 @@
   _renderDrawerContent = () => {
     return (
       <View style={styles.drawerContentWrapper}>
+        {/* $FlowFixMe(>=0.78.0 site=react_native_android_fb) This issue was
+         * found when making Flow check .android.js files. */}
         <RNTesterExampleList
           list={RNTesterList}
           displayTitleRow={true}
@@ -188,6 +190,8 @@
           style={styles.toolbar}
           title="RNTester"
         />
+        {/* $FlowFixMe(>=0.78.0 site=react_native_android_fb) This issue was
+         * found when making Flow check .android.js files. */}
         <RNTesterExampleList
           onNavigate={this._handleAction}
           list={RNTesterList}
