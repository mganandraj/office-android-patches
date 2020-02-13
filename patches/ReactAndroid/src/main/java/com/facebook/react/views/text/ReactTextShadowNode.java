--- "e:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\views\\text\\ReactTextShadowNode.java"	2020-01-30 13:55:48.423613000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\views\\text\\ReactTextShadowNode.java"	2020-01-29 14:10:09.588889300 -0800
@@ -115,6 +115,7 @@
               if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                 builder.setJustificationMode(mJustificationMode);
               }
+
               if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                   builder.setUseLineSpacingFromFallbacks(true);
               }
