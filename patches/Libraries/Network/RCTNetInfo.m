--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Network\\RCTNetInfo.m"	2020-01-30 13:55:47.950609200 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Network\\RCTNetInfo.m"	2020-01-29 14:10:08.945917300 -0800
@@ -148,7 +148,7 @@
     status = RCTReachabilityStateNone;
   }
   
-#if !TARGET_OS_TV
+#if !TARGET_OS_TV && !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   
   else if ((flags & kSCNetworkReachabilityFlagsIsWWAN) != 0) {
     connectionType = RCTConnectionTypeCellular;
