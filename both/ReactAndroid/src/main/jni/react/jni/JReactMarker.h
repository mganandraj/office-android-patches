diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/JReactMarker.h b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/JReactMarker.h
index 916e0c388..6d12e50c9 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/JReactMarker.h
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/JReactMarker.h
@@ -13,14 +13,10 @@
 namespace facebook {
 namespace react {
 
-#ifndef RN_EXPORT
-#define RN_EXPORT __attribute__((visibility("default")))
-#endif
-
 class JReactMarker : public facebook::jni::JavaClass<JReactMarker> {
 public:
   static constexpr auto kJavaDescriptor = "Lcom/facebook/react/bridge/ReactMarker;";
-  static RN_EXPORT void setLogPerfMarkerIfNeeded();
+  static void setLogPerfMarkerIfNeeded();
 
 private:
   static void logMarker(const std::string& marker);
