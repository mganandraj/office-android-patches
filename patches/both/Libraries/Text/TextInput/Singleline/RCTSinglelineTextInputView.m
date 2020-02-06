--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\Singleline\\RCTSinglelineTextInputView.m"	2020-01-30 13:55:47.999606800 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\Singleline\\RCTSinglelineTextInputView.m"	2020-01-29 14:10:09.002885100 -0800
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
