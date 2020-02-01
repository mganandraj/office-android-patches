diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Renderer\\oss\\ReactNativeRenderer-profiling.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Renderer\\oss\\ReactNativeRenderer-profiling.js"
index 5a356fc..6d94114 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Renderer\\oss\\ReactNativeRenderer-profiling.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Renderer\\oss\\ReactNativeRenderer-profiling.js"
@@ -6942,6 +6942,7 @@ function startWorkOnPendingInteraction(root, expirationTime) {
       }
     }
   }
+  performWork(0, !0);
 }
 function finishPendingInteractions(root, committedExpirationTime) {
   var earliestRemainingTimeAfterCommit = root.firstPendingTime,
