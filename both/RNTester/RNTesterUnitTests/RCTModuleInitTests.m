diff --git a/E:/github/ms-react-native-forpatch/RNTester/RNTesterUnitTests/RCTModuleInitTests.m b/E:/github/fb-react-native-forpatch/RNTester/RNTesterUnitTests/RCTModuleInitTests.m
index f4c7dcfb5..3232ec4e8 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/RNTesterUnitTests/RCTModuleInitTests.m
+++ b/E:/github/fb-react-native-forpatch/RNTester/RNTesterUnitTests/RCTModuleInitTests.m
@@ -9,11 +9,7 @@
 #import <Foundation/Foundation.h>
 #import <XCTest/XCTest.h>
 
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203), to run Mac tests
 #import <RCTTest/RCTTestRunner.h>
-#else
-#import "../RCTTest/RCTTestRunner.h"
-#endif // TODO(macOS ISS#2323203)
 #import <React/RCTBridge+Private.h>
 #import <React/RCTBridge.h>
 #import <React/RCTBridgeModule.h>
