--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\Singleline\\RCTSinglelineTextInputViewManager.m"	2020-01-30 13:55:48.000611500 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\Singleline\\RCTSinglelineTextInputViewManager.m"	2020-01-29 14:10:09.003917100 -0800
@@ -24,7 +24,7 @@
   return shadowView;
 }
 
-- (UIView *)view
+- (RCTUIView *)view // TODO(macOS ISS#3536887)
 {
   return [[RCTSinglelineTextInputView alloc] initWithBridge:self.bridge];
 }
