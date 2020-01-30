diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/views/text/ReactTextShadowNode.java b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/views/text/ReactTextShadowNode.java
index 1ad2aeb1d..fd181c1c9 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/views/text/ReactTextShadowNode.java
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/views/text/ReactTextShadowNode.java
@@ -115,7 +115,6 @@ public class ReactTextShadowNode extends ReactBaseTextShadowNode {
               if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                 builder.setJustificationMode(mJustificationMode);
               }
-
               if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                   builder.setUseLineSpacingFromFallbacks(true);
               }
