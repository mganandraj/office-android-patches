--- "e:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\JSBigString.cpp"	2020-01-30 13:55:48.515581300 -0800
+++ "e:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\JSBigString.cpp"	2020-01-29 14:10:09.748923000 -0800
@@ -14,6 +14,8 @@
 #include <folly/portability/SysMman.h>
 #include <folly/ScopeGuard.h>
 
+#include <unistd.h> // ISS for `dup` that we don't pull in otherwise
+
 namespace facebook {
 namespace react {
 
