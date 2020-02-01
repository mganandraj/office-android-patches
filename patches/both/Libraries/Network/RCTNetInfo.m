diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Network\\RCTNetInfo.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Network\\RCTNetInfo.m"
index f9441f1..f295c57 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Network\\RCTNetInfo.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Network\\RCTNetInfo.m"
@@ -148,7 +148,7 @@ static void RCTReachabilityCallback(__unused SCNetworkReachabilityRef target, SC
     status = RCTReachabilityStateNone;
   }
   
-#if !TARGET_OS_TV
+#if !TARGET_OS_TV && !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   
   else if ((flags & kSCNetworkReachabilityFlagsIsWWAN) != 0) {
     connectionType = RCTConnectionTypeCellular;
