diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/first-party/fb/log.cpp b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/first-party/fb/log.cpp
index ecebf3f2a..7d2a70df0 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/first-party/fb/log.cpp
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/first-party/fb/log.cpp
@@ -5,7 +5,6 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#include <fb/CRTSafeAPIs.h>
 #include <fb/log.h>
 #include <stdarg.h>
 #include <stdio.h>
@@ -19,11 +18,11 @@ void setLogHandler(LogHandler logHandler) {
 }
 
 int fb_printLog(int prio, const char *tag,  const char *fmt, ...) {
-  char logBuffer[LOG_BUFFER_SIZE] = {0};
+  char logBuffer[LOG_BUFFER_SIZE];
 
   va_list va_args;
   va_start(va_args, fmt);
-  int result = vsnprintf_safe(logBuffer, sizeof(logBuffer), fmt, va_args);
+  int result = vsnprintf(logBuffer, sizeof(logBuffer), fmt, va_args);
   va_end(va_args);
   if (gLogHandler != NULL) {
       gLogHandler(prio, tag, logBuffer);
