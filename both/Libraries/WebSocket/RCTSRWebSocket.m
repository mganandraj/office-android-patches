diff --git a/E:/github/ms-react-native-forpatch/Libraries/WebSocket/RCTSRWebSocket.m b/E:/github/fb-react-native-forpatch/Libraries/WebSocket/RCTSRWebSocket.m
index cf38043dc..6f1e5e802 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/WebSocket/RCTSRWebSocket.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/WebSocket/RCTSRWebSocket.m
@@ -17,9 +17,7 @@
 #import "RCTSRWebSocket.h"
 
 #import <Availability.h>
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 #import <Endian.h>
-#endif // TODO(macOS ISS#2323203)b
 
 #import <Security/SecRandom.h>
 
