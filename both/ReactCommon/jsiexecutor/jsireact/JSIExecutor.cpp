diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/jsiexecutor/jsireact/JSIExecutor.cpp b/E:/github/fb-react-native-forpatch/ReactCommon/jsiexecutor/jsireact/JSIExecutor.cpp
index 737dca80f..e7ec74077 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/jsiexecutor/jsireact/JSIExecutor.cpp
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/jsiexecutor/jsireact/JSIExecutor.cpp
@@ -3,7 +3,7 @@
 // This source code is licensed under the MIT license found in the
 // LICENSE file in the root directory of this source tree.
 
-#include "JSIExecutor.h"
+#include "jsireact/JSIExecutor.h"
 
 #include <cxxreact/JSBigString.h>
 #include <cxxreact/ModuleRegistry.h>
@@ -68,8 +68,8 @@ JSIExecutor::JSIExecutor(
 }
 
 void JSIExecutor::loadApplicationScript(
-      std::unique_ptr<const JSBigString> script,
-      std::string sourceURL) {
+    std::unique_ptr<const JSBigString> script,
+    std::string sourceURL) {
   SystraceSection s("JSIExecutor::loadApplicationScript");
 
   // TODO: check for and use precompiled HBC
@@ -211,7 +211,7 @@ void JSIExecutor::callFunction(
 void JSIExecutor::invokeCallback(
     const double callbackId,
     const folly::dynamic &arguments) {
-  // SystraceSection s("JSIExecutor::invokeCallback", "callbackId", callbackId);
+  SystraceSection s("JSIExecutor::invokeCallback", "callbackId", callbackId);
   if (!invokeCallbackAndReturnFlushedQueue_) {
     bindBridge();
   }
