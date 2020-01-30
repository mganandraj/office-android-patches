diff --git a/E:/github/ms-react-native-forpatch/Libraries/polyfills/console.js b/E:/github/fb-react-native-forpatch/Libraries/polyfills/console.js
index a0ca85236..e6f53787f 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/polyfills/console.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/polyfills/console.js
@@ -560,8 +560,7 @@ if (global.nativeLoggingHook) {
           // TODO(T43930203): remove this special case once originalConsole.assert properly checks
           // the condition
           if (methodName === 'assert') {
-            if (!arguments[0] && originalConsole.hasOwnProperty('assert')) {
-              // TODO(macOS ISS#2323203)
+            if (!arguments[0]) {
               originalConsole.assert(...arguments);
             }
           } else {
