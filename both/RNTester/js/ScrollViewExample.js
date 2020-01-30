diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/ScrollViewExample.js b/E:/github/fb-react-native-forpatch/RNTester/js/ScrollViewExample.js
index 507539b29..c6c28afb1 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/ScrollViewExample.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/ScrollViewExample.js
@@ -39,7 +39,6 @@ exports.examples = [
               // $FlowFixMe Invalid prop usage
               _scrollView = scrollView;
             }}
-            acceptsKeyboardFocus={true} // TODO(macOS ISS#2323203)
             automaticallyAdjustContentInsets={false}
             onScroll={() => {
               console.log('onScroll!');
