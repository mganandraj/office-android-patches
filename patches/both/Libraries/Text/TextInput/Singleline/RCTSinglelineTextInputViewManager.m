diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\Singleline\\RCTSinglelineTextInputViewManager.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\Singleline\\RCTSinglelineTextInputViewManager.m"
index 5a2af1c..f1a467e 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\Singleline\\RCTSinglelineTextInputViewManager.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\Singleline\\RCTSinglelineTextInputViewManager.m"
@@ -24,7 +24,7 @@ RCT_EXPORT_MODULE()
   return shadowView;
 }
 
-- (UIView *)view
+- (RCTUIView *)view // TODO(macOS ISS#3536887)
 {
   return [[RCTSinglelineTextInputView alloc] initWithBridge:self.bridge];
 }
