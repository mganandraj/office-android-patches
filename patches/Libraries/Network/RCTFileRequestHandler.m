--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Network\\RCTFileRequestHandler.m"	2020-01-30 13:55:47.949608800 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Network\\RCTFileRequestHandler.m"	2020-01-29 14:10:08.944884700 -0800
@@ -7,7 +7,11 @@
 
 #import "RCTFileRequestHandler.h"
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 #import <MobileCoreServices/MobileCoreServices.h>
+#else // [TODO(macOS ISS#2323203)
+#import <CoreServices/CoreServices.h>
+#endif // ]TODO(macOS ISS#2323203)
 
 #import <React/RCTUtils.h>
 
