diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/first-party/fb/assert.cpp b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/first-party/fb/assert.cpp
index 8cf2ed50d..dd64bebc7 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/first-party/fb/assert.cpp
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/first-party/fb/assert.cpp
@@ -9,7 +9,6 @@
 #include <stdio.h>
 
 #include <fb/assert.h>
-#include <fb/CRTSafeAPIs.h>
 #include <fb/log.h>
 
 namespace facebook {
@@ -21,7 +20,7 @@ static AssertHandler gAssertHandler;
 void assertInternal(const char* formatstr ...) {
     va_list va_args;
     va_start(va_args, formatstr);
-    vsnprintf_safe(sAssertBuf, sizeof(sAssertBuf), formatstr, va_args);
+    vsnprintf(sAssertBuf, sizeof(sAssertBuf), formatstr, va_args);
     va_end(va_args);
     if (gAssertHandler != NULL) {
         gAssertHandler(sAssertBuf);
