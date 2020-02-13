--- "e:\\github\\fb-react-native-forpatch-base\\ReactCommon\\yoga\\yoga\\YGNode.h"	2020-01-30 13:55:48.629618800 -0800
+++ "e:\\github\\ms-react-native-forpatch\\ReactCommon\\yoga\\yoga\\YGNode.h"	2020-01-29 14:10:09.846923300 -0800
@@ -24,7 +24,7 @@
   bool hasNewLayout_ : 1;
   bool isReferenceBaseline_ : 1;
   bool isDirty_ : 1;
-  YGNodeType nodeType_ : 1;
+  YGNodeType nodeType_ = {}; // ISS
   bool measureUsesContext_ : 1;
   bool baselineUsesContext_ : 1;
   bool printUsesContext_ : 1;
