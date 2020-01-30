diff --git a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/Multiline/RCTMultilineTextInputViewManager.m b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/Multiline/RCTMultilineTextInputViewManager.m
index 5e62e0c3f..b086dfaec 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/Multiline/RCTMultilineTextInputViewManager.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/Multiline/RCTMultilineTextInputViewManager.m
@@ -13,7 +13,7 @@
 
 RCT_EXPORT_MODULE()
 
-- (RCTUIView *)view // TODO(macOS ISS#3536887)
+- (UIView *)view
 {
   return [[RCTMultilineTextInputView alloc] initWithBridge:self.bridge];
 }
@@ -21,8 +21,7 @@ RCT_EXPORT_MODULE()
 #pragma mark - Multiline <TextInput> (aka TextView) specific properties
 
 #if !TARGET_OS_TV
-RCT_REMAP_NOT_OSX_VIEW_PROPERTY(dataDetectorTypes, backedTextInputView.dataDetectorTypes, UIDataDetectorTypes) // TODO(macOS ISS#2323203)
-RCT_REMAP_OSX_VIEW_PROPERTY(dataDetectorTypes, backedTextInputView.enabledTextCheckingTypes, NSTextCheckingTypes) // TODO(macOS ISS#2323203)
+RCT_REMAP_VIEW_PROPERTY(dataDetectorTypes, backedTextInputView.dataDetectorTypes, UIDataDetectorTypes)
 #endif
 
 @end
