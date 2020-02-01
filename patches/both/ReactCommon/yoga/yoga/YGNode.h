diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\yoga\\yoga\\YGNode.h" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\yoga\\yoga\\YGNode.h"
index bbd1b70..5359c4a 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\yoga\\yoga\\YGNode.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\yoga\\yoga\\YGNode.h"
@@ -24,7 +24,7 @@ private:
   bool hasNewLayout_ : 1;
   bool isReferenceBaseline_ : 1;
   bool isDirty_ : 1;
-  YGNodeType nodeType_ : 1;
+  YGNodeType nodeType_ = {}; // ISS
   bool measureUsesContext_ : 1;
   bool baselineUsesContext_ : 1;
   bool printUsesContext_ : 1;
