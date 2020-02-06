--- "E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\jsi\\JSCRuntime.cpp"	2020-01-30 13:55:48.605620200 -0800
+++ "E:\\github\\ms-react-native-forpatch\\ReactCommon\\jsi\\JSCRuntime.cpp"	2020-01-29 14:10:09.824892300 -0800
@@ -9,7 +9,7 @@
 #include <atomic>
 #include <condition_variable>
 #include <cstdlib>
-#include <jsi/jsilib.h>
+#include "jsi/jsilib.h"
 #include <mutex>
 #include <queue>
 #include <sstream>
@@ -789,7 +789,7 @@
 
 std::shared_ptr<jsi::HostObject> JSCRuntime::getHostObject(
     const jsi::Object& obj) {
-  // We are guarenteed at this point to have isHostObject(obj) == true
+  // We are guaranteed at this point to have isHostObject(obj) == true
   // so the private data should be HostObjectMetadata
   JSObjectRef object = objectRef(obj);
   auto metadata =
