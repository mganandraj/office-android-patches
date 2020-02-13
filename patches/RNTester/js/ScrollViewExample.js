--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\ScrollViewExample.js"	2020-01-30 13:55:48.086613300 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\js\\ScrollViewExample.js"	2020-01-29 14:10:09.184886700 -0800
@@ -39,6 +39,7 @@
               // $FlowFixMe Invalid prop usage
               _scrollView = scrollView;
             }}
+            acceptsKeyboardFocus={true} // TODO(macOS ISS#2323203)
             automaticallyAdjustContentInsets={false}
             onScroll={() => {
               console.log('onScroll!');
