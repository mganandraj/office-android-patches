diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RCTTest\\RCTTestRunner.m" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RCTTest\\RCTTestRunner.m"
index bf2228c..d357295 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RCTTest\\RCTTestRunner.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RCTTest\\RCTTestRunner.m"
@@ -14,6 +14,7 @@
 #import <React/RCTRootView.h>
 #import <React/RCTUIManager.h>
 #import <React/RCTUtils.h>
+#import <React/RCTBundleURLProvider.h> // TODO(macOS ISS#2323203)
 
 #import "FBSnapshotTestController.h"
 #import "RCTTestModule.h"
@@ -87,8 +88,7 @@ RCT_NOT_IMPLEMENTED(- (instancetype)init)
 - (NSURL *)defaultScriptURL
 {
   if (getenv("CI_USE_PACKAGER") || _useBundler) {
-    NSString *bundlePrefix = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"RN_BUNDLE_PREFIX"];
-    return [NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:8081/%@%@.bundle?platform=ios&dev=true", bundlePrefix, _appPath]];
+    return [NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:8081/%@.bundle?platform=%@&dev=true", _appPath, kRCTPlatformName]]; // TODO(macOS ISS#2323203)
   } else {
     return [[NSBundle bundleForClass:[RCTBridge class]] URLForResource:@"main" withExtension:@"jsbundle"];
   }
@@ -172,8 +172,10 @@ expectErrorBlock:(BOOL(^)(NSString *error))expectErrorBlock
     [bridge.devSettings setIsDebuggingRemotely:_useJSDebugger];
     batchedBridge = [bridge batchedBridge];
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     UIViewController *vc = RCTSharedApplication().delegate.window.rootViewController;
     vc.view = [UIView new];
+#endif // TODO(macOS ISS#2323203)
 
     RCTTestModule *testModule = [bridge moduleForClass:[RCTTestModule class]];
     RCTAssert(_testController != nil, @"_testController should not be nil");
@@ -193,7 +195,9 @@ expectErrorBlock:(BOOL(^)(NSString *error))expectErrorBlock
       rootTag = rootView.reactTag;
       testModule.view = rootView;
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
       [vc.view addSubview:rootView]; // Add as subview so it doesn't get resized
+#endif // TODO(macOS ISS#2323203)
 
       if (configurationBlock) {
         configurationBlock(rootView);
@@ -220,7 +224,7 @@ expectErrorBlock:(BOOL(^)(NSString *error))expectErrorBlock
       }
     });
 
-#if RCT_DEV
+#if RCT_DEV && !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     NSArray<UIView *> *nonLayoutSubviews = [vc.view.subviews filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id subview, NSDictionary *bindings) {
       return ![NSStringFromClass([subview class]) isEqualToString:@"_UILayoutGuide"];
     }]];
@@ -231,7 +235,9 @@ expectErrorBlock:(BOOL(^)(NSString *error))expectErrorBlock
     if (expectErrorBlock) {
       RCTAssert(expectErrorBlock(errors[0]), @"Expected an error but the first one was missing or did not match.");
     } else {
-      RCTAssert(errors == nil, @"RedBox errors: %@", errors);
+      // [TODO(OSS Candidate ISS#2710739): xcpretty formats the test failure output to show only one line of the assert string followed by a snippet of source code including the assert statement and the lines just before and after.
+      // Convert the `errors` array into a single line string delimited by \n so that CI logs contain meaningful information.
+      RCTAssert(errors == nil, @"RedBox errors: %@", [[errors valueForKey:@"description"] componentsJoinedByString:@"\\n"]); // ]TODO(OSS Candidate ISS#2710739)
       RCTAssert(testModule.status != RCTTestStatusPending, @"Test didn't finish within %0.f seconds", kTestTimeoutSeconds);
       RCTAssert(testModule.status == RCTTestStatusPassed, @"Test failed");
     }
@@ -254,7 +260,9 @@ expectErrorBlock:(BOOL(^)(NSString *error))expectErrorBlock
     [[NSRunLoop mainRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
     [[NSRunLoop mainRunLoop] runMode:NSRunLoopCommonModes beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
   }
-  RCTAssert(errors == nil, @"RedBox errors during bridge invalidation: %@", errors);
+  if (!expectErrorBlock) { // TODO(tomun): need this to pass -[RNTesterIntegrationTests testTheTester_ExpectError]
+    RCTAssert(errors == nil, @"RedBox errors during bridge invalidation: %@", errors);
+  }
   RCTAssert(batchedBridge == nil, @"Bridge should be deallocated after the test");
 
   RCTSetLogFunction(defaultLogFunction);
