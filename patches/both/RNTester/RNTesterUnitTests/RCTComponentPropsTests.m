--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTComponentPropsTests.m"	2020-01-30 13:55:48.060609000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTComponentPropsTests.m"	2020-01-29 14:10:09.106911500 -0800
@@ -8,7 +8,11 @@
 
 #import <XCTest/XCTest.h>
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203), to run Mac tests
 #import <RCTTest/RCTTestRunner.h>
+#else
+#import "../RCTTest/RCTTestRunner.h"
+#endif // TODO(macOS ISS#2323203)
 #import <React/RCTRootShadowView.h>
 #import <React/RCTShadowView.h>
 #import <React/RCTUIManager.h>
@@ -30,7 +34,7 @@
 
 @end
 
-@interface RCTPropsTestView : UIView
+@interface RCTPropsTestView : RCTUIView // TODO(macOS ISS#3536887)
 
 @property (nonatomic, assign) NSInteger integerProp;
 @property (nonatomic, strong) id objectProp;
@@ -49,7 +53,7 @@
 
 RCT_EXPORT_MODULE()
 
-- (UIView *)view
+- (RCTUIView *)view // TODO(macOS ISS#3536887)
 {
   RCTPropsTestView *view = [RCTPropsTestView new];
   view.integerProp = 57;
@@ -111,7 +115,7 @@
 
   dispatch_async(uiManager.methodQueue, ^{
     [uiManager createView:@2 viewName:@"RCTPropsTestView" rootTag:self->_rootViewReactTag props:props];
-    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
+    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
       view = (RCTPropsTestView *)viewRegistry[@2];
       XCTAssertEqual(view.integerProp, 58);
       XCTAssertEqualObjects(view.objectProp, @10);
@@ -134,13 +138,13 @@
   
   dispatch_async(uiManager.methodQueue, ^{
     [uiManager createView:@2 viewName:@"RCTPropsTestView" rootTag:self->_rootViewReactTag props:@{}];
-    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
+    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
       view = (RCTPropsTestView *)viewRegistry[@2];
       XCTAssertEqual(view.layer.allowsGroupOpacity, TRUE);
       [initialExpectation fulfill];
     }];
     [uiManager updateView:@2 viewName:@"RCTPropsTestView" props:@{@"needsOffscreenAlphaCompositing": @NO}];
-    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
+    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
       view = (RCTPropsTestView *)viewRegistry[@2];
       XCTAssertEqual(view.layer.allowsGroupOpacity, FALSE);
       [updateExpectation fulfill];
@@ -168,7 +172,7 @@
   dispatch_async(uiManager.methodQueue, ^{
     [uiManager createView:@2 viewName:@"RCTPropsTestView" rootTag:self->_rootViewReactTag props:props];
     [uiManager updateView:@2 viewName:@"RCTPropsTestView" props:resetProps];
-    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
+    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
       view = (RCTPropsTestView *)viewRegistry[@2];
       XCTAssertEqual(view.integerProp, 57);
       XCTAssertEqualObjects(view.objectProp, @9);
@@ -190,12 +194,12 @@
 
   dispatch_async(uiManager.methodQueue, ^{
     [uiManager createView:@2 viewName:@"RCTView" rootTag:self->_rootViewReactTag props:props];
-    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
+    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
       view = (RCTView *)viewRegistry[@2];
       XCTAssertEqualObjects(view.backgroundColor, [RCTConvert UIColor:@0xffffffff]);
     }];
     [uiManager updateView:@2 viewName:@"RCTView" props:resetProps];
-    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, __unused NSDictionary<NSNumber *,UIView *> *viewRegistry) {
+    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, __unused NSDictionary<NSNumber *,RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
       view = (RCTView *)viewRegistry[@2];
       XCTAssertNil(view.backgroundColor);
     }];
