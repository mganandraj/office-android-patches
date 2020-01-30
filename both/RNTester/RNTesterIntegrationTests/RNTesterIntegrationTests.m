diff --git a/E:/github/ms-react-native-forpatch/RNTester/RNTesterIntegrationTests/RNTesterIntegrationTests.m b/E:/github/fb-react-native-forpatch/RNTester/RNTesterIntegrationTests/RNTesterIntegrationTests.m
index 8bb2bec4c..1fd0c0d52 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/RNTesterIntegrationTests/RNTesterIntegrationTests.m
+++ b/E:/github/fb-react-native-forpatch/RNTester/RNTesterIntegrationTests/RNTesterIntegrationTests.m
@@ -5,7 +5,7 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <React/RCTUIKit.h>
+#import <UIKit/UIKit.h>
 #import <XCTest/XCTest.h>
 
 #import <RCTTest/RCTTestRunner.h>
@@ -67,15 +67,12 @@ RCT_TEST(IntegrationTestHarnessTest)
 RCT_TEST(AsyncStorageTest)
 RCT_TEST(AppEventsTest)
 //RCT_TEST(ImageCachePolicyTest) // This test never passed.
-//RCT_TEST(ImageSnapshotTest)
+RCT_TEST(ImageSnapshotTest)
 //RCT_TEST(LayoutEventsTest) // Disabled due to flakiness: #8686784
 RCT_TEST(SimpleSnapshotTest)
 RCT_TEST(SyncMethodTest)
 RCT_TEST(PromiseTest)
 RCT_TEST_ONLY_WITH_PACKAGER(WebSocketTest) // Requires a WebSocket test server, see scripts/objc-test.sh
-#if !TARGET_OS_OSX // ios specific
 RCT_TEST(AccessibilityManagerTest)
-#endif
 
 @end
-
