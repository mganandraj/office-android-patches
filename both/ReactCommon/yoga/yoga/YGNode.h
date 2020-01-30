diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/yoga/yoga/YGNode.h b/E:/github/fb-react-native-forpatch/ReactCommon/yoga/yoga/YGNode.h
index 5359c4a68..bbd1b7031 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/yoga/yoga/YGNode.h
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/yoga/yoga/YGNode.h
@@ -24,7 +24,7 @@ private:
   bool hasNewLayout_ : 1;
   bool isReferenceBaseline_ : 1;
   bool isDirty_ : 1;
-  YGNodeType nodeType_ = {}; // ISS
+  YGNodeType nodeType_ : 1;
   bool measureUsesContext_ : 1;
   bool baselineUsesContext_ : 1;
   bool printUsesContext_ : 1;
