diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Renderer\\oss\\ReactFabric-profiling.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Renderer\\oss\\ReactFabric-profiling.js"
index 74761df..fcfe473 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Renderer\\oss\\ReactFabric-profiling.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Renderer\\oss\\ReactFabric-profiling.js"
@@ -6752,6 +6752,7 @@ function startWorkOnPendingInteraction(root, expirationTime) {
       }
     }
   }
+  performWork(0, !0);
 }
 function finishPendingInteractions(root, committedExpirationTime) {
   var earliestRemainingTimeAfterCommit = root.firstPendingTime,
