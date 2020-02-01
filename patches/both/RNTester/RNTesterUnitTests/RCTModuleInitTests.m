diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTModuleInitTests.m" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTModuleInitTests.m"
index 3232ec4..f4c7dcf 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTModuleInitTests.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTModuleInitTests.m"
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
