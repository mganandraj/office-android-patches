diff --git a/E:/github/ms-react-native-forpatch/RNTester/RNTesterUnitTests/RCTModuleInitNotificationRaceTests.m b/E:/github/fb-react-native-forpatch/RNTester/RNTesterUnitTests/RCTModuleInitNotificationRaceTests.m
index 46e2a8a3e..137408b6f 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/RNTesterUnitTests/RCTModuleInitNotificationRaceTests.m
+++ b/E:/github/fb-react-native-forpatch/RNTester/RNTesterUnitTests/RCTModuleInitNotificationRaceTests.m
@@ -9,11 +9,7 @@
 #import <Foundation/Foundation.h>
 #import <XCTest/XCTest.h>
 
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203), to run Mac tests
 #import <RCTTest/RCTTestRunner.h>
-#else
-#import "../RCTTest/RCTTestRunner.h"
-#endif // TODO(macOS ISS#2323203)
 #import <React/RCTBridge.h>
 #import <React/RCTBridgeModule.h>
 #import <React/RCTJavaScriptExecutor.h>
