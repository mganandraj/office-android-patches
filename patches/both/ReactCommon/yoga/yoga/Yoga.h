diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\yoga\\yoga\\Yoga.h" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\yoga\\yoga\\Yoga.h"
index a9dc01d..2ac5432 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\yoga\\yoga\\Yoga.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\yoga\\yoga\\Yoga.h"
@@ -365,4 +365,9 @@ void YGTraversePreOrder(
 
 void YGNodeSetChildren(YGNodeRef owner, const std::vector<YGNodeRef>& children);
 
+// Operator declarations moved down here, outside of the extern C block
+extern bool operator==(const YGValue& lhs, const YGValue& rhs);
+extern bool operator!=(const YGValue& lhs, const YGValue& rhs);
+// #endif
+
 #endif
