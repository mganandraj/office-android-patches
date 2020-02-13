--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTGzipTests.m"	2020-01-30 13:55:48.062612700 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTGzipTests.m"	2020-01-29 14:10:09.107907800 -0800
@@ -8,7 +8,11 @@
 
 #import <XCTest/XCTest.h>
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203), to run Mac tests
 #import <RCTTest/RCTTestRunner.h>
+#else
+#import "../RCTTest/RCTTestRunner.h"
+#endif // TODO(macOS ISS#2323203)
 #import <React/RCTNetworking.h>
 #import <React/RCTUtils.h>
 
