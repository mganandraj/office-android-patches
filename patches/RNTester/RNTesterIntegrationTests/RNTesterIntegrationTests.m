--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterIntegrationTests\\RNTesterIntegrationTests.m"	2020-01-30 13:55:48.048612700 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterIntegrationTests\\RNTesterIntegrationTests.m"	2020-01-29 14:10:09.068885900 -0800
@@ -5,7 +5,7 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h>
 #import <XCTest/XCTest.h>
 
 #import <RCTTest/RCTTestRunner.h>
@@ -67,12 +67,15 @@
 RCT_TEST(AsyncStorageTest)
 RCT_TEST(AppEventsTest)
 //RCT_TEST(ImageCachePolicyTest) // This test never passed.
-RCT_TEST(ImageSnapshotTest)
+//RCT_TEST(ImageSnapshotTest)
 //RCT_TEST(LayoutEventsTest) // Disabled due to flakiness: #8686784
 RCT_TEST(SimpleSnapshotTest)
 RCT_TEST(SyncMethodTest)
 RCT_TEST(PromiseTest)
 RCT_TEST_ONLY_WITH_PACKAGER(WebSocketTest) // Requires a WebSocket test server, see scripts/objc-test.sh
+#if !TARGET_OS_OSX // ios specific
 RCT_TEST(AccessibilityManagerTest)
+#endif
 
 @end
+
