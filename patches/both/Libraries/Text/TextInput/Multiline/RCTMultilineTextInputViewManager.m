diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\Multiline\\RCTMultilineTextInputViewManager.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\Multiline\\RCTMultilineTextInputViewManager.m"
index b086dfa..5e62e0c 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\Multiline\\RCTMultilineTextInputViewManager.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\Multiline\\RCTMultilineTextInputViewManager.m"
@@ -13,7 +13,7 @@
 
 RCT_EXPORT_MODULE()
 
-- (UIView *)view
+- (RCTUIView *)view // TODO(macOS ISS#3536887)
 {
   return [[RCTMultilineTextInputView alloc] initWithBridge:self.bridge];
 }
@@ -21,7 +21,8 @@ RCT_EXPORT_MODULE()
 #pragma mark - Multiline <TextInput> (aka TextView) specific properties
 
 #if !TARGET_OS_TV
-RCT_REMAP_VIEW_PROPERTY(dataDetectorTypes, backedTextInputView.dataDetectorTypes, UIDataDetectorTypes)
+RCT_REMAP_NOT_OSX_VIEW_PROPERTY(dataDetectorTypes, backedTextInputView.dataDetectorTypes, UIDataDetectorTypes) // TODO(macOS ISS#2323203)
+RCT_REMAP_OSX_VIEW_PROPERTY(dataDetectorTypes, backedTextInputView.enabledTextCheckingTypes, NSTextCheckingTypes) // TODO(macOS ISS#2323203)
 #endif
 
 @end
