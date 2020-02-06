--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\Multiline\\RCTMultilineTextInputView.m"	2020-01-30 13:55:47.992616800 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\Multiline\\RCTMultilineTextInputView.m"	2020-01-29 14:10:08.996882800 -0800
@@ -13,6 +13,9 @@
 
 @implementation RCTMultilineTextInputView
 {
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+  RCTUIScrollView *_scrollView; // TODO(macOS ISS#3536887)
+#endif // ]TODO(macOS ISS#2323203)
   RCTUITextView *_backedTextInputView;
 }
 
@@ -24,30 +27,82 @@
 
     _backedTextInputView = [[RCTUITextView alloc] initWithFrame:self.bounds];
     _backedTextInputView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
-    _backedTextInputView.backgroundColor = [UIColor clearColor];
-    _backedTextInputView.textColor = [UIColor blackColor];
+    _backedTextInputView.backgroundColor = [RCTUIColor clearColor]; // TODO(OSS Candidate ISS#2710739)
+    _backedTextInputView.textColor = [RCTUIColor blackColor]; // TODO(OSS Candidate ISS#2710739)
     // This line actually removes 5pt (default value) left and right padding in UITextView.
     _backedTextInputView.textContainer.lineFragmentPadding = 0;
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 #if !TARGET_OS_TV
     _backedTextInputView.scrollsToTop = NO;
 #endif
     _backedTextInputView.scrollEnabled = YES;
+#else // [TODO(macOS ISS#2323203)
+    _scrollView = [[RCTUIScrollView alloc] initWithFrame:self.bounds]; // TODO(macOS ISS#3536887)
+    _scrollView.backgroundColor = [RCTUIColor clearColor];
+    _scrollView.drawsBackground = NO;
+    _scrollView.borderType = NSNoBorder;
+    _scrollView.hasHorizontalRuler = NO;
+    _scrollView.hasVerticalRuler = NO;
+    _scrollView.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
+    
+    _backedTextInputView.verticallyResizable = YES;
+    _backedTextInputView.horizontallyResizable = YES;
+    _backedTextInputView.textContainer.containerSize = NSMakeSize(CGFLOAT_MAX, CGFLOAT_MAX);
+    _backedTextInputView.textContainer.widthTracksTextView = YES;
+#endif // ]TODO(macOS ISS#2323203)
     _backedTextInputView.textInputDelegate = self;
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     [self addSubview:_backedTextInputView];
+#else // [TODO(macOS ISS#2323203)
+    _scrollView.documentView = _backedTextInputView;
+    _scrollView.contentView.postsBoundsChangedNotifications = YES;
+    [self addSubview:_scrollView];
+    
+    // a register for those notifications on the content view.
+    [[NSNotificationCenter defaultCenter] addObserver:self
+                                             selector:@selector(boundDidChange:)
+                                                 name:NSViewBoundsDidChangeNotification
+                                               object:_scrollView.contentView];
+#endif // ]TODO(macOS ISS#2323203)
   }
 
   return self;
 }
 
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+- (void)dealloc
+{
+  [[NSNotificationCenter defaultCenter] removeObserver:self];
+}
+#endif // ]TODO(macOS ISS#2323203)
+
 - (id<RCTBackedTextInputViewProtocol>)backedTextInputView
 {
   return _backedTextInputView;
 }
 
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+- (void)setReactPaddingInsets:(UIEdgeInsets)reactPaddingInsets
+{
+  [super setReactPaddingInsets:reactPaddingInsets];
+  // We apply `paddingInsets` as `backedTextInputView`'s `textContainerInsets` on mac.
+  ((RCTUITextView*)self.backedTextInputView).textContainerInsets = reactPaddingInsets;
+  [self setNeedsLayout];
+}
+
+- (void)setReactBorderInsets:(UIEdgeInsets)reactBorderInsets
+{
+  [super setReactBorderInsets:reactBorderInsets];
+  // We apply `borderInsets` as `_scrollView` layout offset on mac.
+  _scrollView.frame = UIEdgeInsetsInsetRect(self.frame, reactBorderInsets);
+  [self setNeedsLayout];
+}
+#endif // ]TODO(macOS ISS#2323203)
+
 #pragma mark - UIScrollViewDelegate
 
-- (void)scrollViewDidScroll:(UIScrollView *)scrollView
+- (void)scrollViewDidScroll:(RCTUIScrollView *)scrollView // TODO(macOS ISS#3536887)
 {
   RCTDirectEventBlock onScroll = self.onScroll;
 
@@ -81,4 +136,22 @@
   }
 }
 
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+
+#pragma mark - Notification handling
+
+- (void)boundDidChange:(NSNotification*)NSNotification
+{
+  [self scrollViewDidScroll:_scrollView];
+}
+
+#pragma mark - NSResponder chain
+
+- (BOOL)acceptsFirstResponder
+{
+  return _backedTextInputView.acceptsFirstResponder;
+}
+
+#endif // ]TODO(macOS ISS#2323203)
+
 @end
