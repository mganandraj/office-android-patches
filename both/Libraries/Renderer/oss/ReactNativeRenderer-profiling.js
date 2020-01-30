diff --git a/E:/github/ms-react-native-forpatch/Libraries/Renderer/oss/ReactNativeRenderer-profiling.js b/E:/github/fb-react-native-forpatch/Libraries/Renderer/oss/ReactNativeRenderer-profiling.js
index 6d94114dd..5a356fca8 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Renderer/oss/ReactNativeRenderer-profiling.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Renderer/oss/ReactNativeRenderer-profiling.js
@@ -6942,7 +6942,6 @@ function startWorkOnPendingInteraction(root, expirationTime) {
       }
     }
   }
-  performWork(0, !0);
 }
 function finishPendingInteractions(root, committedExpirationTime) {
   var earliestRemainingTimeAfterCommit = root.firstPendingTime,
