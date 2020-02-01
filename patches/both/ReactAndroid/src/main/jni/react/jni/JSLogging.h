diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\react\\jni\\JSLogging.h" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\react\\jni\\JSLogging.h"
index 222952e..b4cea0a 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\react\\jni\\JSLogging.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\react\\jni\\JSLogging.h"
@@ -11,12 +11,17 @@
 namespace facebook {
 namespace react {
 
-void reactAndroidLoggingHook(
-    const std::string& message,
-    android_LogPriority logLevel);
-void reactAndroidLoggingHook(
-    const std::string& message,
-    unsigned int logLevel);
+#ifndef RN_EXPORT
+#define RN_EXPORT __attribute__((visibility("default")))
+#endif
+
+void RN_EXPORT reactAndroidLoggingHook(
+  const std::string& message,
+  android_LogPriority logLevel);
+
+void RN_EXPORT reactAndroidLoggingHook(
+  const std::string& message,
+  unsigned int logLevel);
 
 } // namespace react
 } // namespace facebook
