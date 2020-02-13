--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTModuleInitTests.m"	2020-01-30 13:55:48.064609100 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTModuleInitTests.m"	2020-01-29 14:10:09.109882700 -0800
@@ -9,7 +9,11 @@
 #import <Foundation/Foundation.h>
 #import <XCTest/XCTest.h>
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203), to run Mac tests
 #import <RCTTest/RCTTestRunner.h>
+#else
+#import "../RCTTest/RCTTestRunner.h"
+#endif // TODO(macOS ISS#2323203)
 #import <React/RCTBridge+Private.h>
 #import <React/RCTBridge.h>
 #import <React/RCTBridgeModule.h>
