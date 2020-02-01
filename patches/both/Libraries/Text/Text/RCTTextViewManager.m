diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\Text\\RCTTextViewManager.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\Text\\RCTTextViewManager.m"
index 9e0af36..0e4b3b9 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\Text\\RCTTextViewManager.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\Text\\RCTTextViewManager.m"
@@ -44,10 +44,12 @@ RCT_EXPORT_VIEW_PROPERTY(selectable, BOOL)
 
   [bridge.uiManager.observerCoordinator addObserver:self];
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   [[NSNotificationCenter defaultCenter] addObserver:self
                                            selector:@selector(handleDidUpdateMultiplierNotification)
                                                name:RCTAccessibilityManagerDidUpdateMultiplierNotification
                                              object:bridge.accessibilityManager];
+#endif // TODO(macOS ISS#2323203)
 }
 
 - (void)dealloc
@@ -55,7 +57,7 @@ RCT_EXPORT_VIEW_PROPERTY(selectable, BOOL)
   [[NSNotificationCenter defaultCenter] removeObserver:self];
 }
 
-- (UIView *)view
+- (RCTUIView *)view // TODO(macOS ISS#3536887)
 {
   return [RCTTextView new];
 }
@@ -63,7 +65,9 @@ RCT_EXPORT_VIEW_PROPERTY(selectable, BOOL)
 - (RCTShadowView *)shadowView
 {
   RCTTextShadowView *shadowView = [[RCTTextShadowView alloc] initWithBridge:self.bridge];
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   shadowView.textAttributes.fontSizeMultiplier = self.bridge.accessibilityManager.multiplier;
+#endif // TODO(macOS ISS#2323203)
   [_shadowViews addObject:shadowView];
   return shadowView;
 }
