diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\first-party\\fb\\log.cpp" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\first-party\\fb\\log.cpp"
index 7d2a70d..ecebf3f 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\first-party\\fb\\log.cpp"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\first-party\\fb\\log.cpp"
@@ -5,6 +5,7 @@
  * LICENSE file in the root directory of this source tree.
  */
 
+#include <fb/CRTSafeAPIs.h>
 #include <fb/log.h>
 #include <stdarg.h>
 #include <stdio.h>
@@ -18,11 +19,11 @@ void setLogHandler(LogHandler logHandler) {
 }
 
 int fb_printLog(int prio, const char *tag,  const char *fmt, ...) {
-  char logBuffer[LOG_BUFFER_SIZE];
+  char logBuffer[LOG_BUFFER_SIZE] = {0};
 
   va_list va_args;
   va_start(va_args, fmt);
-  int result = vsnprintf(logBuffer, sizeof(logBuffer), fmt, va_args);
+  int result = vsnprintf_safe(logBuffer, sizeof(logBuffer), fmt, va_args);
   va_end(va_args);
   if (gLogHandler != NULL) {
       gLogHandler(prio, tag, logBuffer);
