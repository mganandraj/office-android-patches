diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\ReactMarker.h" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\ReactMarker.h"
index 21d5deb..ef0e28a 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\ReactMarker.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\ReactMarker.h"
@@ -24,7 +24,10 @@ enum ReactMarkerId {
   NATIVE_MODULE_SETUP_START,
   NATIVE_MODULE_SETUP_STOP,
   REGISTER_JS_SEGMENT_START,
-  REGISTER_JS_SEGMENT_STOP
+  REGISTER_JS_SEGMENT_STOP,
+  BYTECODE_CREATION_FAILED,
+  BYTECODE_READ_FAILED,
+  BYTECODE_WRITE_FAILED
 };
 
 #ifdef __APPLE__
