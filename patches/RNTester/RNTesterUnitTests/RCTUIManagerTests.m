--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTUIManagerTests.m"	2020-01-30 13:55:48.066609200 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTUIManagerTests.m"	2020-01-29 14:10:09.110882900 -0800
@@ -21,7 +21,7 @@
         removeAtIndices:(NSArray *)removeAtIndices
                registry:(NSDictionary<NSNumber *, id<RCTComponent>> *)registry;
 
-@property (nonatomic, copy, readonly) NSMutableDictionary<NSNumber *, UIView *> *viewRegistry;
+@property (nonatomic, copy, readonly) NSMutableDictionary<NSNumber *, RCTUIView *> *viewRegistry; // TODO(macOS ISS#3536887)
 
 @end
 
@@ -41,7 +41,7 @@
 
   // Register 20 views to use in the tests
   for (NSInteger i = 1; i <= 20; i++) {
-    UIView *registeredView = [UIView new];
+    RCTUIView *registeredView = [RCTUIView new]; // TODO(macOS ISS#3536887)
     registeredView.reactTag = @(i);
     _uiManager.viewRegistry[@(i)] = registeredView;
   }
@@ -49,7 +49,7 @@
 
 - (void)testManagingChildrenToAddViews
 {
-  UIView *containerView = _uiManager.viewRegistry[@20];
+  RCTUIView *containerView = _uiManager.viewRegistry[@20]; // TODO(macOS ISS#3536887)
   NSMutableArray *addedViews = [NSMutableArray array];
 
   NSArray *tagsToAdd = @[@1, @2, @3, @4, @5];
@@ -72,7 +72,7 @@
   XCTAssertTrue([[containerView reactSubviews] count] == 5,
                @"Expect to have 5 react subviews after calling manage children \
                with 5 tags to add, instead have %lu", (unsigned long)[[containerView reactSubviews] count]);
-  for (UIView *view in addedViews) {
+  for (RCTUIView *view in addedViews) { // TODO(macOS ISS#3536887)
     XCTAssertTrue([view reactSuperview] == containerView,
                   @"Expected to have manage children successfully add children");
     [view removeFromSuperview];
@@ -81,7 +81,7 @@
 
 - (void)testManagingChildrenToRemoveViews
 {
-  UIView *containerView = _uiManager.viewRegistry[@20];
+  RCTUIView *containerView = _uiManager.viewRegistry[@20]; // TODO(macOS ISS#3536887)
   NSMutableArray *removedViews = [NSMutableArray array];
 
   NSArray *removeAtIndices = @[@0, @4, @8, @12, @16];
@@ -90,7 +90,7 @@
     [removedViews addObject:_uiManager.viewRegistry[reactTag]];
   }
   for (NSInteger i = 2; i < 20; i++) {
-    UIView *view = _uiManager.viewRegistry[@(i)];
+    RCTUIView *view = _uiManager.viewRegistry[@(i)]; // TODO(macOS ISS#3536887)
     [containerView insertReactSubview:view atIndex:containerView.reactSubviews.count];
   }
 
@@ -109,14 +109,14 @@
                @"Expect to have 13 react subviews after calling manage children\
                with 5 tags to remove and 18 prior children, instead have %zd",
                containerView.reactSubviews.count);
-  for (UIView *view in removedViews) {
+  for (RCTUIView *view in removedViews) { // TODO(macOS ISS#3536887)
     XCTAssertTrue([view reactSuperview] == nil,
                  @"Expected to have manage children successfully remove children");
     // After removing views are unregistered - we need to reregister
     _uiManager.viewRegistry[view.reactTag] = view;
   }
   for (NSInteger i = 2; i < 20; i++) {
-    UIView *view = _uiManager.viewRegistry[@(i)];
+    RCTUIView *view = _uiManager.viewRegistry[@(i)]; // TODO(macOS ISS#3536887)
     if (![removedViews containsObject:view]) {
       XCTAssertTrue([view superview] == containerView,
                    @"Should not have removed view with react tag %ld during delete but did", (long)i);
@@ -135,7 +135,7 @@
 // [11,5,1,2,7,8,12,10]
 - (void)testManagingChildrenToAddRemoveAndMove
 {
-  UIView *containerView = _uiManager.viewRegistry[@20];
+  RCTUIView *containerView = _uiManager.viewRegistry[@20]; // TODO(macOS ISS#3536887)
 
   NSArray *removeAtIndices = @[@2, @3, @5, @8];
   NSArray *addAtIndices = @[@0, @6];
@@ -147,12 +147,12 @@
   NSMutableArray *viewsToRemove = [NSMutableArray array];
   for (NSUInteger i = 0; i < removeAtIndices.count; i++) {
     NSNumber *reactTagToRemove = @([removeAtIndices[i] integerValue] + 1);
-    UIView *viewToRemove = _uiManager.viewRegistry[reactTagToRemove];
+    RCTUIView *viewToRemove = _uiManager.viewRegistry[reactTagToRemove]; // TODO(macOS ISS#3536887)
     [viewsToRemove addObject:viewToRemove];
   }
 
   for (NSInteger i = 1; i < 11; i++) {
-    UIView *view = _uiManager.viewRegistry[@(i)];
+    RCTUIView *view = _uiManager.viewRegistry[@(i)]; // TODO(macOS ISS#3536887)
     [containerView insertReactSubview:view atIndex:containerView.reactSubviews.count];
   }
 
@@ -179,10 +179,10 @@
 
   // Clean up after ourselves
   for (NSInteger i = 1; i < 13; i++) {
-    UIView *view = _uiManager.viewRegistry[@(i)];
+    RCTUIView *view = _uiManager.viewRegistry[@(i)]; // TODO(macOS ISS#3536887)
     [view removeFromSuperview];
   }
-  for (UIView *view in viewsToRemove) {
+  for (RCTUIView *view in viewsToRemove) { // TODO(macOS ISS#3536887)
     _uiManager.viewRegistry[view.reactTag] = view;
   }
 }
