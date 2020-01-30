diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/yoga/yoga/Yoga.h b/E:/github/fb-react-native-forpatch/ReactCommon/yoga/yoga/Yoga.h
index 2ac54324c..a9dc01dca 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/yoga/yoga/Yoga.h
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/yoga/yoga/Yoga.h
@@ -365,9 +365,4 @@ void YGTraversePreOrder(
 
 void YGNodeSetChildren(YGNodeRef owner, const std::vector<YGNodeRef>& children);
 
-// Operator declarations moved down here, outside of the extern C block
-extern bool operator==(const YGValue& lhs, const YGValue& rhs);
-extern bool operator!=(const YGValue& lhs, const YGValue& rhs);
-// #endif
-
 #endif
