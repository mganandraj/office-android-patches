diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/first-party/yogajni/jni/YGJNI.cpp b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/first-party/yogajni/jni/YGJNI.cpp
index 5448f613c..280116614 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/first-party/yogajni/jni/YGJNI.cpp
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/first-party/yogajni/jni/YGJNI.cpp
@@ -4,8 +4,6 @@
  * This source code is licensed under the MIT license found in the LICENSE
  * file in the root directory of this source tree.
  */
-
-#include <fb/CRTSafeAPIs.h>
 #include <fb/fbjni.h>
 #include <yoga/YGNode.h>
 #include <yoga/Yoga.h>
@@ -418,15 +416,15 @@ static int YGJNILogFunc(
     const YGConfigRef config,
     const YGNodeRef node,
     YGLogLevel level,
-    void *layoutContext,
-    const char *format,
+    void* layoutContext,
+    const char* format,
     va_list args) {
-  int result = vsnprintf_safe(NULL, 0, format, args);
+  int result = vsnprintf(NULL, 0, format, args);
   std::vector<char> buffer(1 + result);
-  vsnprintf_safe(buffer.data(), buffer.size(), format, args);
+  vsnprintf(buffer.data(), buffer.size(), format, args);
 
   auto jloggerPtr =
-      static_cast<global_ref<JYogaLogger> *>(YGConfigGetContext(config));
+      static_cast<global_ref<JYogaLogger>*>(YGConfigGetContext(config));
   if (jloggerPtr != nullptr) {
     if (auto obj = YGNodeJobject(node, layoutContext)) {
       (*jloggerPtr)
