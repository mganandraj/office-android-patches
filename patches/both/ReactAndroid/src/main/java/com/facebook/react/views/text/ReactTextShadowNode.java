diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\views\\text\\ReactTextShadowNode.java" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\views\\text\\ReactTextShadowNode.java"
index fd181c1..1ad2aeb 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\views\\text\\ReactTextShadowNode.java"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\views\\text\\ReactTextShadowNode.java"
@@ -115,6 +115,7 @@ public class ReactTextShadowNode extends ReactBaseTextShadowNode {
               if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                 builder.setJustificationMode(mJustificationMode);
               }
+
               if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                   builder.setUseLineSpacingFromFallbacks(true);
               }
