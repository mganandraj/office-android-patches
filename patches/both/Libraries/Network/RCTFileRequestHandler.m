diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Network\\RCTFileRequestHandler.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Network\\RCTFileRequestHandler.m"
index 00041a7..77427cc 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Network\\RCTFileRequestHandler.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Network\\RCTFileRequestHandler.m"
@@ -7,7 +7,11 @@
 
 #import "RCTFileRequestHandler.h"
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 #import <MobileCoreServices/MobileCoreServices.h>
+#else // [TODO(macOS ISS#2323203)
+#import <CoreServices/CoreServices.h>
+#endif // ]TODO(macOS ISS#2323203)
 
 #import <React/RCTUtils.h>
 
