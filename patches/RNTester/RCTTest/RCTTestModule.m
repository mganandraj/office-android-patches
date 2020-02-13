--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\RCTTest\\RCTTestModule.m"	2020-01-30 13:55:48.041611400 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\RCTTest\\RCTTestModule.m"	2020-01-29 14:10:09.048883600 -0800
@@ -31,7 +31,7 @@
 {
   RCTAssert(_controller != nil, @"No snapshot controller configured.");
 
-  [_bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
+  [_bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
     NSString *testName = NSStringFromSelector(self->_testSelector);
     if (!self->_snapshotCounter) {
       self->_snapshotCounter = [NSMutableDictionary new];
@@ -81,7 +81,7 @@
 
 RCT_EXPORT_METHOD(markTestPassed:(BOOL)success)
 {
-  [_bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, __unused NSDictionary<NSNumber *, UIView *> *viewRegistry) {
+  [_bridge.uiManager addUIBlock:^(__unused RCTUIManager *uiManager, __unused NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
     self->_status = success ? RCTTestStatusPassed : RCTTestStatusFailed;
   }];
 }
