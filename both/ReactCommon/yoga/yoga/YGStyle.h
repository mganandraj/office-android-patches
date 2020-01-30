diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/yoga/yoga/YGStyle.h b/E:/github/fb-react-native-forpatch/ReactCommon/yoga/yoga/YGStyle.h
index 0634c0de5..77c7e0386 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/yoga/yoga/YGStyle.h
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/yoga/yoga/YGStyle.h
@@ -16,13 +16,6 @@
 #include "Yoga-internal.h"
 #include "Yoga.h"
 
-
-// Until we sync past this: https://github.com/facebook/react-native/commit/a7e4ce0f0d83b6162d77db7d680e838666f6d938#diff-140c478f1096be49a1b121931a7680ee
-// We have to turn off the bitfield usage for MSVC builds
-#ifdef _MSC_VER
-#define ENUM_BITFIELDS_NOT_SUPPORTED
-#endif
-
 #if !defined(ENUM_BITFIELDS_NOT_SUPPORTED)
 #define BITFIELD_ENUM_SIZED(num) : num
 #else
