diff --git a/E:/github/ms-react-native-forpatch/RNTester/RCTTest/RCTTestModule.m b/E:/github/fb-react-native-forpatch/RNTester/RCTTest/RCTTestModule.m
index f6b418fe0..e4c5c1a98 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/RCTTest/RCTTestModule.m
+++ b/E:/github/fb-react-native-forpatch/RNTester/RCTTest/RCTTestModule.m
@@ -31,7 +31,7 @@ RCT_EXPORT_METHOD(verifySnapshot:(RCTResponseSenderBlock)callback)
 {
   RCTAssert(_controller != nil, @"No snapshot controller configured.");
 
-  [_bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
+  [_bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
     NSString *testName = NSStringFromSelector(self->_testSelector);
     if (!self->_snapshotCounter) {
       self->_snapshotCounter = [NSMutableDictionary new];
@@ -81,7 +81,7 @@ RCT_EXPORT_METHOD(markTestCompleted)
 
 RCT_EXPORT_METHOD(markTestPassed:(BOOL)success)
 {
-  [_bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, __unused NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
+  [_bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, __unused NSDictionary<NSNumber *, UIView *> *viewRegistry) {
     self->_status = success ? RCTTestStatusPassed : RCTTestStatusFailed;
   }];
 }
