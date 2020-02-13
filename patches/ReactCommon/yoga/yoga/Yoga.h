--- "e:\\github\\fb-react-native-forpatch-base\\ReactCommon\\yoga\\yoga\\Yoga.h"	2020-01-30 13:55:48.632608500 -0800
+++ "e:\\github\\ms-react-native-forpatch\\ReactCommon\\yoga\\yoga\\Yoga.h"	2020-01-29 14:10:09.850895400 -0800
@@ -365,4 +365,9 @@
 
 void YGNodeSetChildren(YGNodeRef owner, const std::vector<YGNodeRef>& children);
 
+// Operator declarations moved down here, outside of the extern C block
+extern bool operator==(const YGValue& lhs, const YGValue& rhs);
+extern bool operator!=(const YGValue& lhs, const YGValue& rhs);
+// #endif
+
 #endif
