diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTAllocationTests.m" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTAllocationTests.m"
index e088566..034cf78 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTAllocationTests.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTAllocationTests.m"
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
 #import <React/RCTModuleMethod.h>
@@ -156,7 +160,7 @@ RCT_EXPORT_METHOD(test:(__unused NSString *)a
   RCTBridge *bridge = [[RCTBridge alloc] initWithBundleURL:_bundleURL
                                             moduleProvider:nil
                                              launchOptions:nil];
-  __weak UIView *rootContentView;
+  __weak RCTUIView *rootContentView; // TODO(macOS ISS#3536887)
   @autoreleasepool {
     RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge moduleName:@"" initialProperties:nil];
     RCT_RUN_RUNLOOP_WHILE(!(rootContentView = [rootView valueForKey:@"contentView"]))
