--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\polyfills\\console.js"	2020-01-30 13:55:48.030611900 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\polyfills\\console.js"	2020-01-29 14:10:09.036884000 -0800
@@ -560,7 +560,8 @@
           // TODO(T43930203): remove this special case once originalConsole.assert properly checks
           // the condition
           if (methodName === 'assert') {
-            if (!arguments[0]) {
+            if (!arguments[0] && originalConsole.hasOwnProperty('assert')) {
+              // TODO(macOS ISS#2323203)
               originalConsole.assert(...arguments);
             }
           } else {
