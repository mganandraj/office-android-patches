diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\react\\jni\\JReactMarker.h" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\react\\jni\\JReactMarker.h"
index 6d12e50..916e0c3 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\react\\jni\\JReactMarker.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\react\\jni\\JReactMarker.h"
@@ -13,10 +13,14 @@
 namespace facebook {
 namespace react {
 
+#ifndef RN_EXPORT
+#define RN_EXPORT __attribute__((visibility("default")))
+#endif
+
 class JReactMarker : public facebook::jni::JavaClass<JReactMarker> {
 public:
   static constexpr auto kJavaDescriptor = "Lcom/facebook/react/bridge/ReactMarker;";
-  static void setLogPerfMarkerIfNeeded();
+  static RN_EXPORT void setLogPerfMarkerIfNeeded();
 
 private:
   static void logMarker(const std::string& marker);
