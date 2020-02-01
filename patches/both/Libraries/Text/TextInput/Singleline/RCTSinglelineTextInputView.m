diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\Singleline\\RCTSinglelineTextInputView.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\Singleline\\RCTSinglelineTextInputView.m"
index 4292a04..6ecc26a 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\Singleline\\RCTSinglelineTextInputView.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\Singleline\\RCTSinglelineTextInputView.m"
@@ -37,4 +37,22 @@
   return _backedTextInputView;
 }
 
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+- (void)setReactPaddingInsets:(UIEdgeInsets)reactPaddingInsets
+{
+  [super setReactPaddingInsets:reactPaddingInsets];
+  // We apply `paddingInsets` as `backedTextInputView`'s `textContainerInsets` on mac.
+  ((RCTUITextField*)self.backedTextInputView).textContainerInset = reactPaddingInsets;
+  [self setNeedsLayout];
+}
+
+- (void)setReactBorderInsets:(UIEdgeInsets)reactBorderInsets
+{
+  [super setReactBorderInsets:reactBorderInsets];
+  // We apply `borderInsets` as `backedTextInputView`'s layout offset on mac.
+  ((RCTUITextField*)self.backedTextInputView).frame = UIEdgeInsetsInsetRect(self.bounds, reactBorderInsets);
+  [self setNeedsLayout];
+}
+#endif // ]TODO(macOS ISS#2323203)
+
 @end
