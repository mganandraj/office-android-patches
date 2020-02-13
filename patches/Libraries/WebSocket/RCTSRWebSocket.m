--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\WebSocket\\RCTSRWebSocket.m"	2020-01-30 13:55:48.016612300 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\WebSocket\\RCTSRWebSocket.m"	2020-01-29 14:10:09.022883900 -0800
@@ -17,7 +17,9 @@
 #import "RCTSRWebSocket.h"
 
 #import <Availability.h>
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 #import <Endian.h>
+#endif // TODO(macOS ISS#2323203)b
 
 #import <Security/SecRandom.h>
 
