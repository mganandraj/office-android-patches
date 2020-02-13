--- "e:\\github\\fb-react-native-forpatch-base\\ReactCommon\\yoga\\yoga\\YGStyle.h"	2020-01-30 13:55:48.630608000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\ReactCommon\\yoga\\yoga\\YGStyle.h"	2020-01-29 14:10:09.847892700 -0800
@@ -16,6 +16,13 @@
 #include "Yoga-internal.h"
 #include "Yoga.h"
 
+
+// Until we sync past this: https://github.com/facebook/react-native/commit/a7e4ce0f0d83b6162d77db7d680e838666f6d938#diff-140c478f1096be49a1b121931a7680ee
+// We have to turn off the bitfield usage for MSVC builds
+#ifdef _MSC_VER
+#define ENUM_BITFIELDS_NOT_SUPPORTED
+#endif
+
 #if !defined(ENUM_BITFIELDS_NOT_SUPPORTED)
 #define BITFIELD_ENUM_SIZED(num) : num
 #else
