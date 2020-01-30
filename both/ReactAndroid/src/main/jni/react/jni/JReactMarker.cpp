diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/JReactMarker.cpp b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/JReactMarker.cpp
index fd4d6110b..4f4589795 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/JReactMarker.cpp
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/JReactMarker.cpp
@@ -53,15 +53,6 @@ void JReactMarker::logPerfMarker(const ReactMarker::ReactMarkerId markerId, cons
     case ReactMarker::NATIVE_MODULE_SETUP_STOP:
       JReactMarker::logMarker("NATIVE_MODULE_SETUP_END", tag);
       break;
-    case ReactMarker::BYTECODE_CREATION_FAILED:
-      JReactMarker::logMarker("BYTECODE_CREATION_FAILED");
-      break;
-    case ReactMarker::BYTECODE_READ_FAILED:
-      JReactMarker::logMarker("BYTECODE_READ_FAILED", tag);
-      break;
-    case ReactMarker::BYTECODE_WRITE_FAILED:
-      JReactMarker::logMarker("BYTECODE_WRITE_FAILED");
-      break;
     case ReactMarker::REGISTER_JS_SEGMENT_START:
       JReactMarker::logMarker("REGISTER_JS_SEGMENT_START", tag);
       break;
