diff --git a/E:/github/ms-react-native-forpatch/RNTester/RNTesterIntegrationTests/RNTesterSnapshotTests.m b/E:/github/fb-react-native-forpatch/RNTester/RNTesterIntegrationTests/RNTesterSnapshotTests.m
index 41ca2d1fd..55998e0bf 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/RNTesterIntegrationTests/RNTesterSnapshotTests.m
+++ b/E:/github/fb-react-native-forpatch/RNTester/RNTesterIntegrationTests/RNTesterSnapshotTests.m
@@ -6,7 +6,7 @@
  *
  */
 
-#import <React/RCTUIKit.h>
+#import <UIKit/UIKit.h>
 #import <XCTest/XCTest.h>
 
 #import <RCTTest/RCTTestRunner.h>
@@ -22,14 +22,10 @@
 
 - (void)setUp
 {
-#if !TARGET_OS_OSX
   _runner = RCTInitRunnerForApp(@"RNTester/js/RNTesterApp.ios", nil, nil);
   if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10) {
     _runner.testSuffix = [NSString stringWithFormat:@"-iOS%d", UIDevice.currentDevice.systemVersion.intValue];
   }
-#else // TARGET_OS_OSX
-  _runner = RCTInitRunnerForApp(@"RNTester/js/RNTesterApp.macos", nil, nil);
-#endif
   _runner.recordMode = NO;
 }
 
@@ -43,9 +39,8 @@ RCT_TEST(ViewExample)
 RCT_TEST(LayoutExample)
 RCT_TEST(ARTExample)
 RCT_TEST(ScrollViewExample)
-#if !TARGET_OS_TV
-// TODO(OSS Candidate ISS#2710739): RCTPicker which TextExample depends on not available on tvOS
 RCT_TEST(TextExample)
+#if !TARGET_OS_TV
 // No switch or slider available on tvOS
 RCT_TEST(SwitchExample)
 RCT_TEST(SliderExample)
