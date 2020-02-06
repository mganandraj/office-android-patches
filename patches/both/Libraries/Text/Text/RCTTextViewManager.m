--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\Text\\RCTTextViewManager.m"	2020-01-30 13:55:47.991610000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\Text\\RCTTextViewManager.m"	2020-01-29 14:10:08.995883600 -0800
@@ -44,10 +44,12 @@
 
   [bridge.uiManager.observerCoordinator addObserver:self];
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   [[NSNotificationCenter defaultCenter] addObserver:self
                                            selector:@selector(handleDidUpdateMultiplierNotification)
                                                name:RCTAccessibilityManagerDidUpdateMultiplierNotification
                                              object:bridge.accessibilityManager];
+#endif // TODO(macOS ISS#2323203)
 }
 
 - (void)dealloc
@@ -55,7 +57,7 @@
   [[NSNotificationCenter defaultCenter] removeObserver:self];
 }
 
-- (UIView *)view
+- (RCTUIView *)view // TODO(macOS ISS#3536887)
 {
   return [RCTTextView new];
 }
@@ -63,7 +65,9 @@
 - (RCTShadowView *)shadowView
 {
   RCTTextShadowView *shadowView = [[RCTTextShadowView alloc] initWithBridge:self.bridge];
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   shadowView.textAttributes.fontSizeMultiplier = self.bridge.accessibilityManager.multiplier;
+#endif // TODO(macOS ISS#2323203)
   [_shadowViews addObject:shadowView];
   return shadowView;
 }
