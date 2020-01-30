diff --git a/E:/github/ms-react-native-forpatch/Libraries/WebSocket/RCTReconnectingWebSocket.m b/E:/github/fb-react-native-forpatch/Libraries/WebSocket/RCTReconnectingWebSocket.m
index d6d2569f2..caaf891d7 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/WebSocket/RCTReconnectingWebSocket.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/WebSocket/RCTReconnectingWebSocket.m
@@ -24,8 +24,6 @@
 
 #if RCT_DEV // Only supported in dev mode
 
-#if DEBUG // TODO(OSS Candidate ISS#2710739)
-
 #if __has_include(<os/log.h>) && defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && __IPHONE_OS_VERSION_MAX_ALLOWED >= 100300 /* __IPHONE_10_3 */
 
 // From https://github.com/apple/swift/blob/ad40c770bfe372f879b530443a3d94761fe258a6/stdlib/public/SDK/os/os_log.m
@@ -78,8 +76,6 @@ static void my_os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, co
 
 #endif /* __IPHONE_11_0 */
 
-#endif /* DEBUG */ // TODO(OSS Candidate ISS#2710739)
-
 @interface RCTReconnectingWebSocket () <RCTSRWebSocketDelegate>
 @end
 
@@ -88,7 +84,6 @@ static void my_os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, co
   RCTSRWebSocket *_socket;
 }
 
-#if DEBUG // TODO(OSS Candidate ISS#2710739)
 + (void)load
 {
   static dispatch_once_t onceToken;
@@ -108,7 +103,6 @@ static void my_os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, co
 #endif /* __IPHONE_11_0 */
   });
 }
-#endif /* DEBUG */ // TODO(OSS Candidate ISS#2710739)
 
 - (instancetype)initWithURL:(NSURL *)url queue:(dispatch_queue_t)queue
 {
