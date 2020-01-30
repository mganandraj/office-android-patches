diff --git a/E:/github/ms-react-native-forpatch/RNTester/RNTesterUnitTests/RCTComponentPropsTests.m b/E:/github/fb-react-native-forpatch/RNTester/RNTesterUnitTests/RCTComponentPropsTests.m
index 8ad7b1ae6..9b66322d7 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/RNTesterUnitTests/RCTComponentPropsTests.m
+++ b/E:/github/fb-react-native-forpatch/RNTester/RNTesterUnitTests/RCTComponentPropsTests.m
@@ -8,11 +8,7 @@
 
 #import <XCTest/XCTest.h>
 
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203), to run Mac tests
 #import <RCTTest/RCTTestRunner.h>
-#else
-#import "../RCTTest/RCTTestRunner.h"
-#endif // TODO(macOS ISS#2323203)
 #import <React/RCTRootShadowView.h>
 #import <React/RCTShadowView.h>
 #import <React/RCTUIManager.h>
@@ -34,7 +30,7 @@
 
 @end
 
-@interface RCTPropsTestView : RCTUIView // TODO(macOS ISS#3536887)
+@interface RCTPropsTestView : UIView
 
 @property (nonatomic, assign) NSInteger integerProp;
 @property (nonatomic, strong) id objectProp;
@@ -53,7 +49,7 @@
 
 RCT_EXPORT_MODULE()
 
-- (RCTUIView *)view // TODO(macOS ISS#3536887)
+- (UIView *)view
 {
   RCTPropsTestView *view = [RCTPropsTestView new];
   view.integerProp = 57;
@@ -115,7 +111,7 @@ RCT_CUSTOM_VIEW_PROPERTY(customProp, NSString, RCTPropsTestView)
 
   dispatch_async(uiManager.methodQueue, ^{
     [uiManager createView:@2 viewName:@"RCTPropsTestView" rootTag:self->_rootViewReactTag props:props];
-    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
+    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
       view = (RCTPropsTestView *)viewRegistry[@2];
       XCTAssertEqual(view.integerProp, 58);
       XCTAssertEqualObjects(view.objectProp, @10);
@@ -138,13 +134,13 @@ RCT_CUSTOM_VIEW_PROPERTY(customProp, NSString, RCTPropsTestView)
   
   dispatch_async(uiManager.methodQueue, ^{
     [uiManager createView:@2 viewName:@"RCTPropsTestView" rootTag:self->_rootViewReactTag props:@{}];
-    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
+    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
       view = (RCTPropsTestView *)viewRegistry[@2];
       XCTAssertEqual(view.layer.allowsGroupOpacity, TRUE);
       [initialExpectation fulfill];
     }];
     [uiManager updateView:@2 viewName:@"RCTPropsTestView" props:@{@"needsOffscreenAlphaCompositing": @NO}];
-    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
+    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
       view = (RCTPropsTestView *)viewRegistry[@2];
       XCTAssertEqual(view.layer.allowsGroupOpacity, FALSE);
       [updateExpectation fulfill];
@@ -172,7 +168,7 @@ RCT_CUSTOM_VIEW_PROPERTY(customProp, NSString, RCTPropsTestView)
   dispatch_async(uiManager.methodQueue, ^{
     [uiManager createView:@2 viewName:@"RCTPropsTestView" rootTag:self->_rootViewReactTag props:props];
     [uiManager updateView:@2 viewName:@"RCTPropsTestView" props:resetProps];
-    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
+    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
       view = (RCTPropsTestView *)viewRegistry[@2];
       XCTAssertEqual(view.integerProp, 57);
       XCTAssertEqualObjects(view.objectProp, @9);
@@ -194,12 +190,12 @@ RCT_CUSTOM_VIEW_PROPERTY(customProp, NSString, RCTPropsTestView)
 
   dispatch_async(uiManager.methodQueue, ^{
     [uiManager createView:@2 viewName:@"RCTView" rootTag:self->_rootViewReactTag props:props];
-    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
+    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
       view = (RCTView *)viewRegistry[@2];
       XCTAssertEqualObjects(view.backgroundColor, [RCTConvert UIColor:@0xffffffff]);
     }];
     [uiManager updateView:@2 viewName:@"RCTView" props:resetProps];
-    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, __unused NSDictionary<NSNumber *,RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
+    [uiManager addUIBlock:^(__unused RCTUIManager *_uiManager, __unused NSDictionary<NSNumber *,UIView *> *viewRegistry) {
       view = (RCTView *)viewRegistry[@2];
       XCTAssertNil(view.backgroundColor);
     }];
