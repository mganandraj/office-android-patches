--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Renderer\\oss\\ReactNativeRenderer-profiling.js"	2020-01-30 13:55:47.971609300 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Renderer\\oss\\ReactNativeRenderer-profiling.js"	2020-01-29 14:10:08.974884500 -0800
@@ -6942,6 +6942,7 @@
       }
     }
   }
+  performWork(0, !0);
 }
 function finishPendingInteractions(root, committedExpirationTime) {
   var earliestRemainingTimeAfterCommit = root.firstPendingTime,
