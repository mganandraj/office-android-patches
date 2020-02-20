--- "e:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\JSBigString.h"	2020-01-30 13:55:48.515581300 -0800
+++ "e:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\JSBigString.h"	2020-02-20 11:21:17.378514000 -0800
@@ -6,7 +6,6 @@
 #pragma once
 
 #include <fcntl.h>
-#include <unistd.h>
 #include <sys/mman.h>
 
 #include <folly/Exception.h>
@@ -29,7 +28,7 @@
 // large string needs to be curried into a std::function<>, which must
 // by CopyConstructible.
 
-class JSBigString {
+class RN_EXPORT JSBigString {
 public:
   JSBigString() = default;
 
