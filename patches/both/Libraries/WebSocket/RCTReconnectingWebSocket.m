--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\WebSocket\\RCTReconnectingWebSocket.m"	2020-01-30 13:55:48.015619800 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\WebSocket\\RCTReconnectingWebSocket.m"	2020-01-29 14:10:09.022883900 -0800
@@ -24,6 +24,8 @@
 
 #if RCT_DEV // Only supported in dev mode
 
+#if DEBUG // TODO(OSS Candidate ISS#2710739)
+
 #if __has_include(<os/log.h>) && defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && __IPHONE_OS_VERSION_MAX_ALLOWED >= 100300 /* __IPHONE_10_3 */
 
 // From https://github.com/apple/swift/blob/ad40c770bfe372f879b530443a3d94761fe258a6/stdlib/public/SDK/os/os_log.m
@@ -76,6 +78,8 @@
 
 #endif /* __IPHONE_11_0 */
 
+#endif /* DEBUG */ // TODO(OSS Candidate ISS#2710739)
+
 @interface RCTReconnectingWebSocket () <RCTSRWebSocketDelegate>
 @end
 
@@ -84,6 +88,7 @@
   RCTSRWebSocket *_socket;
 }
 
+#if DEBUG // TODO(OSS Candidate ISS#2710739)
 + (void)load
 {
   static dispatch_once_t onceToken;
@@ -103,6 +108,7 @@
 #endif /* __IPHONE_11_0 */
   });
 }
+#endif /* DEBUG */ // TODO(OSS Candidate ISS#2710739)
 
 - (instancetype)initWithURL:(NSURL *)url queue:(dispatch_queue_t)queue
 {
