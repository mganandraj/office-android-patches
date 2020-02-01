diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\ScrollViewExample.js" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\ScrollViewExample.js"
index c6c28af..507539b 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\ScrollViewExample.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\ScrollViewExample.js"
@@ -39,6 +39,7 @@ exports.examples = [
               // $FlowFixMe Invalid prop usage
               _scrollView = scrollView;
             }}
+            acceptsKeyboardFocus={true} // TODO(macOS ISS#2323203)
             automaticallyAdjustContentInsets={false}
             onScroll={() => {
               console.log('onScroll!');
