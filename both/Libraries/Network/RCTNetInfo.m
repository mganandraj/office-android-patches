diff --git a/E:/github/ms-react-native-forpatch/Libraries/Network/RCTNetInfo.m b/E:/github/fb-react-native-forpatch/Libraries/Network/RCTNetInfo.m
index f295c57dd..f9441f16b 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Network/RCTNetInfo.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/Network/RCTNetInfo.m
@@ -148,7 +148,7 @@ static void RCTReachabilityCallback(__unused SCNetworkReachabilityRef target, SC
     status = RCTReachabilityStateNone;
   }
   
-#if !TARGET_OS_TV && !TARGET_OS_OSX // TODO(macOS ISS#2323203)
+#if !TARGET_OS_TV
   
   else if ((flags & kSCNetworkReachabilityFlagsIsWWAN) != 0) {
     connectionType = RCTConnectionTypeCellular;
