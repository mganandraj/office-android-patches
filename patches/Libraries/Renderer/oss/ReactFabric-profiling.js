--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Renderer\\oss\\ReactFabric-profiling.js"	2020-01-30 13:55:47.969608000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Renderer\\oss\\ReactFabric-profiling.js"	2020-01-29 14:10:08.971883300 -0800
@@ -6752,6 +6752,7 @@
       }
     }
   }
+  performWork(0, !0);
 }
 function finishPendingInteractions(root, committedExpirationTime) {
   var earliestRemainingTimeAfterCommit = root.firstPendingTime,
