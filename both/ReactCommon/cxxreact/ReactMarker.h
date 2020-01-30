diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/ReactMarker.h b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/ReactMarker.h
index ef0e28a99..21d5deb00 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/ReactMarker.h
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/ReactMarker.h
@@ -24,10 +24,7 @@ enum ReactMarkerId {
   NATIVE_MODULE_SETUP_START,
   NATIVE_MODULE_SETUP_STOP,
   REGISTER_JS_SEGMENT_START,
-  REGISTER_JS_SEGMENT_STOP,
-  BYTECODE_CREATION_FAILED,
-  BYTECODE_READ_FAILED,
-  BYTECODE_WRITE_FAILED
+  REGISTER_JS_SEGMENT_STOP
 };
 
 #ifdef __APPLE__
