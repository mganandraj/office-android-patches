diff --git a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/Singleline/RCTSinglelineTextInputViewManager.m b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/Singleline/RCTSinglelineTextInputViewManager.m
index f1a467eb4..5a2af1cbc 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/Singleline/RCTSinglelineTextInputViewManager.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/Singleline/RCTSinglelineTextInputViewManager.m
@@ -24,7 +24,7 @@ RCT_EXPORT_MODULE()
   return shadowView;
 }
 
-- (RCTUIView *)view // TODO(macOS ISS#3536887)
+- (UIView *)view
 {
   return [[RCTSinglelineTextInputView alloc] initWithBridge:self.bridge];
 }
