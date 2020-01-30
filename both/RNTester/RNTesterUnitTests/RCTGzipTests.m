diff --git a/E:/github/ms-react-native-forpatch/RNTester/RNTesterUnitTests/RCTGzipTests.m b/E:/github/fb-react-native-forpatch/RNTester/RNTesterUnitTests/RCTGzipTests.m
index 670475006..1a077ab67 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/RNTesterUnitTests/RCTGzipTests.m
+++ b/E:/github/fb-react-native-forpatch/RNTester/RNTesterUnitTests/RCTGzipTests.m
@@ -8,11 +8,7 @@
 
 #import <XCTest/XCTest.h>
 
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203), to run Mac tests
 #import <RCTTest/RCTTestRunner.h>
-#else
-#import "../RCTTest/RCTTestRunner.h"
-#endif // TODO(macOS ISS#2323203)
 #import <React/RCTNetworking.h>
 #import <React/RCTUtils.h>
 
