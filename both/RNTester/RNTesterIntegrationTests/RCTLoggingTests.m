diff --git a/E:/github/ms-react-native-forpatch/RNTester/RNTesterIntegrationTests/RCTLoggingTests.m b/E:/github/fb-react-native-forpatch/RNTester/RNTesterIntegrationTests/RCTLoggingTests.m
index 020aa1b99..e1ed8b0b8 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/RNTesterIntegrationTests/RCTLoggingTests.m
+++ b/E:/github/fb-react-native-forpatch/RNTester/RNTesterIntegrationTests/RCTLoggingTests.m
@@ -11,7 +11,6 @@
 #import <React/RCTAssert.h>
 #import <React/RCTBridge.h>
 #import <React/RCTLog.h>
-#import <React/RCTBundleURLProvider.h>
 
 @interface RCTLoggingTests : XCTestCase
 
@@ -32,9 +31,6 @@
   NSURL *scriptURL;
   if (getenv("CI_USE_PACKAGER")) {
     NSString *bundlePrefix = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"RN_BUNDLE_PREFIX"];
-    if (bundlePrefix == nil) { // [TODO(macOS ISS#2323203) There's a convoluted crash if the bundler prefix is null, meaning the RN_BUNDLE_PREFIX wasn't set. New platforms won't have this set and don't need it to run, so default to a reasonable fallback.
-      bundlePrefix = @"";
-    } // TODO(macOS ISS#2323203)]
     NSString *app = @"IntegrationTests/IntegrationTestsApp";
     scriptURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:8081/%@%@.bundle?platform=ios&dev=true", bundlePrefix, app]];
   } else {
@@ -43,7 +39,6 @@
   RCTAssert(scriptURL != nil, @"No scriptURL set");
 
   _bridge = [[RCTBridge alloc] initWithBundleURL:scriptURL moduleProvider:NULL launchOptions:nil];
-
   NSDate *date = [NSDate dateWithTimeIntervalSinceNow:60];
   while (date.timeIntervalSinceNow > 0 && _bridge.loading) {
     [[NSRunLoop mainRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
@@ -61,8 +56,6 @@
   RCTSetLogFunction(RCTDefaultLogFunction);
 }
 
-#define RCT_TEST_LOGGING_TIMEOUT dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 15) // TODO(OSS Candidate ISS#2710739)
-
 - (void)testLogging
 {
   // First console log call will fire after 2.0 sec, to allow for any initial log messages
@@ -80,32 +73,32 @@
     }
   });
   // Wait for console log to signal the semaphore
-  dispatch_semaphore_wait(_logSem, RCT_TEST_LOGGING_TIMEOUT); // TODO(OSS Candidate ISS#2710739)
+  dispatch_semaphore_wait(_logSem, DISPATCH_TIME_FOREVER);
 
   XCTAssertEqual(_lastLogLevel, RCTLogLevelInfo);
   XCTAssertEqual(_lastLogSource, RCTLogSourceJavaScript);
   XCTAssertEqualObjects(_lastLogMessage, @"Invoking console.log");
 
   [_bridge enqueueJSCall:@"LoggingTestModule.warning" args:@[@"Generating warning"]];
-  dispatch_semaphore_wait(_logSem, RCT_TEST_LOGGING_TIMEOUT); // TODO(OSS Candidate ISS#2710739)
+  dispatch_semaphore_wait(_logSem, DISPATCH_TIME_FOREVER);
 
   XCTAssertEqual(_lastLogLevel, RCTLogLevelWarning);
   XCTAssertEqual(_lastLogSource, RCTLogSourceJavaScript);
   XCTAssertEqualObjects(_lastLogMessage, @"Warning: Generating warning");
 
   [_bridge enqueueJSCall:@"LoggingTestModule.invariant" args:@[@"Invariant failed"]];
-  dispatch_semaphore_wait(_logSem, RCT_TEST_LOGGING_TIMEOUT); // TODO(OSS Candidate ISS#2710739)
+  dispatch_semaphore_wait(_logSem, DISPATCH_TIME_FOREVER);
 
   XCTAssertEqual(_lastLogLevel, RCTLogLevelError);
   XCTAssertEqual(_lastLogSource, RCTLogSourceJavaScript);
   XCTAssertEqualObjects(_lastLogMessage, @"Invariant failed");
 
   [_bridge enqueueJSCall:@"LoggingTestModule.logErrorToConsole" args:@[@"Invoking console.error"]];
-  dispatch_semaphore_wait(_logSem, RCT_TEST_LOGGING_TIMEOUT); // TODO(OSS Candidate ISS#2710739)
+  dispatch_semaphore_wait(_logSem, DISPATCH_TIME_FOREVER);
 
   // For local bundles, we'll first get a warning about symbolication
   if ([_bridge.bundleURL isFileURL]) {
-    dispatch_semaphore_wait(_logSem, RCT_TEST_LOGGING_TIMEOUT); // TODO(OSS Candidate ISS#2710739)
+    dispatch_semaphore_wait(_logSem, DISPATCH_TIME_FOREVER);
   }
 
   XCTAssertEqual(_lastLogLevel, RCTLogLevelError);
@@ -113,11 +106,11 @@
   XCTAssertEqualObjects(_lastLogMessage, @"Invoking console.error");
 
   [_bridge enqueueJSCall:@"LoggingTestModule.throwError" args:@[@"Throwing an error"]];
-  dispatch_semaphore_wait(_logSem, RCT_TEST_LOGGING_TIMEOUT); // TODO(OSS Candidate ISS#2710739)
+  dispatch_semaphore_wait(_logSem, DISPATCH_TIME_FOREVER);
 
   // For local bundles, we'll first get a warning about symbolication
   if ([_bridge.bundleURL isFileURL]) {
-    dispatch_semaphore_wait(_logSem, RCT_TEST_LOGGING_TIMEOUT); // TODO(OSS Candidate ISS#2710739)
+    dispatch_semaphore_wait(_logSem, DISPATCH_TIME_FOREVER);
   }
 
   XCTAssertEqual(_lastLogLevel, RCTLogLevelError);
