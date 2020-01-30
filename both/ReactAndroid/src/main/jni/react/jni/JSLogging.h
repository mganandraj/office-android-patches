diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/JSLogging.h b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/JSLogging.h
index b4cea0a3c..222952e27 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/JSLogging.h
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/JSLogging.h
@@ -11,17 +11,12 @@
 namespace facebook {
 namespace react {
 
-#ifndef RN_EXPORT
-#define RN_EXPORT __attribute__((visibility("default")))
-#endif
-
-void RN_EXPORT reactAndroidLoggingHook(
-  const std::string& message,
-  android_LogPriority logLevel);
-
-void RN_EXPORT reactAndroidLoggingHook(
-  const std::string& message,
-  unsigned int logLevel);
+void reactAndroidLoggingHook(
+    const std::string& message,
+    android_LogPriority logLevel);
+void reactAndroidLoggingHook(
+    const std::string& message,
+    unsigned int logLevel);
 
 } // namespace react
 } // namespace facebook
