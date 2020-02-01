diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\first-party\\fb\\assert.cpp" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\first-party\\fb\\assert.cpp"
index dd64beb..8cf2ed5 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\jni\\first-party\\fb\\assert.cpp"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\jni\\first-party\\fb\\assert.cpp"
@@ -9,6 +9,7 @@
 #include <stdio.h>
 
 #include <fb/assert.h>
+#include <fb/CRTSafeAPIs.h>
 #include <fb/log.h>
 
 namespace facebook {
@@ -20,7 +21,7 @@ static AssertHandler gAssertHandler;
 void assertInternal(const char* formatstr ...) {
     va_list va_args;
     va_start(va_args, formatstr);
-    vsnprintf(sAssertBuf, sizeof(sAssertBuf), formatstr, va_args);
+    vsnprintf_safe(sAssertBuf, sizeof(sAssertBuf), formatstr, va_args);
     va_end(va_args);
     if (gAssertHandler != NULL) {
         gAssertHandler(sAssertBuf);
