diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/JSBigString.cpp b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/JSBigString.cpp
index 265ce916d..dc997d1cd 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/JSBigString.cpp
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/JSBigString.cpp
@@ -14,8 +14,6 @@
 #include <folly/portability/SysMman.h>
 #include <folly/ScopeGuard.h>
 
-#include <unistd.h> // ISS for `dup` that we don't pull in otherwise
-
 namespace facebook {
 namespace react {
 
