diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\JSBigString.cpp" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\JSBigString.cpp"
index dc997d1..265ce91 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\JSBigString.cpp"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\JSBigString.cpp"
@@ -14,6 +14,8 @@
 #include <folly/portability/SysMman.h>
 #include <folly/ScopeGuard.h>
 
+#include <unistd.h> // ISS for `dup` that we don't pull in otherwise
+
 namespace facebook {
 namespace react {
 
