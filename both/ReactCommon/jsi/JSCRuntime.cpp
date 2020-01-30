diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/jsi/JSCRuntime.cpp b/E:/github/fb-react-native-forpatch/ReactCommon/jsi/JSCRuntime.cpp
index c4f0dee90..2b5341c3f 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/jsi/JSCRuntime.cpp
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/jsi/JSCRuntime.cpp
@@ -9,7 +9,7 @@
 #include <atomic>
 #include <condition_variable>
 #include <cstdlib>
-#include "jsi/jsilib.h"
+#include <jsi/jsilib.h>
 #include <mutex>
 #include <queue>
 #include <sstream>
@@ -789,7 +789,7 @@ jsi::Object JSCRuntime::createObject(std::shared_ptr<jsi::HostObject> ho) {
 
 std::shared_ptr<jsi::HostObject> JSCRuntime::getHostObject(
     const jsi::Object& obj) {
-  // We are guaranteed at this point to have isHostObject(obj) == true
+  // We are guarenteed at this point to have isHostObject(obj) == true
   // so the private data should be HostObjectMetadata
   JSObjectRef object = objectRef(obj);
   auto metadata =
