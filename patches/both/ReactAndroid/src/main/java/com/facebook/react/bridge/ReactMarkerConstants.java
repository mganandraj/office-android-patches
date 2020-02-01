diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\ReactMarkerConstants.java" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\ReactMarkerConstants.java"
index b829282..9d10f63 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\ReactMarkerConstants.java"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\ReactMarkerConstants.java"
@@ -88,6 +88,9 @@ public enum ReactMarkerConstants {
   CREATE_MC_MODULE_GET_METADATA_END,
   REGISTER_JS_SEGMENT_START,
   REGISTER_JS_SEGMENT_STOP,
+  BYTECODE_CREATION_FAILED,
+  BYTECODE_READ_FAILED,
+  BYTECODE_WRITE_FAILED,
   VM_INIT,
   ON_FRAGMENT_CREATE,
   JAVASCRIPT_EXECUTOR_FACTORY_INJECT_START,
