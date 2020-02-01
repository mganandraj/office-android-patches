diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\WebSocket\\RCTSRWebSocket.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\WebSocket\\RCTSRWebSocket.m"
index 6f1e5e8..cf38043 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\WebSocket\\RCTSRWebSocket.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\WebSocket\\RCTSRWebSocket.m"
@@ -17,7 +17,9 @@
 #import "RCTSRWebSocket.h"
 
 #import <Availability.h>
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 #import <Endian.h>
+#endif // TODO(macOS ISS#2323203)b
 
 #import <Security/SecRandom.h>
 
