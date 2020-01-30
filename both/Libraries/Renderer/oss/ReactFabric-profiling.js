diff --git a/E:/github/ms-react-native-forpatch/Libraries/Renderer/oss/ReactFabric-profiling.js b/E:/github/fb-react-native-forpatch/Libraries/Renderer/oss/ReactFabric-profiling.js
index fcfe473e5..74761df87 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Renderer/oss/ReactFabric-profiling.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Renderer/oss/ReactFabric-profiling.js
@@ -6752,7 +6752,6 @@ function startWorkOnPendingInteraction(root, expirationTime) {
       }
     }
   }
-  performWork(0, !0);
 }
 function finishPendingInteractions(root, committedExpirationTime) {
   var earliestRemainingTimeAfterCommit = root.firstPendingTime,
