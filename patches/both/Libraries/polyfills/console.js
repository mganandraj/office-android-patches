diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\polyfills\\console.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\polyfills\\console.js"
index e6f5378..a0ca852 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\polyfills\\console.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\polyfills\\console.js"
@@ -560,7 +560,8 @@ if (global.nativeLoggingHook) {
           // TODO(T43930203): remove this special case once originalConsole.assert properly checks
           // the condition
           if (methodName === 'assert') {
-            if (!arguments[0]) {
+            if (!arguments[0] && originalConsole.hasOwnProperty('assert')) {
+              // TODO(macOS ISS#2323203)
               originalConsole.assert(...arguments);
             }
           } else {
