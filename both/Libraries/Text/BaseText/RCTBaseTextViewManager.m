diff --git a/E:/github/ms-react-native-forpatch/Libraries/Text/BaseText/RCTBaseTextViewManager.m b/E:/github/fb-react-native-forpatch/Libraries/Text/BaseText/RCTBaseTextViewManager.m
index de1c65a9f..247c636d9 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Text/BaseText/RCTBaseTextViewManager.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/Text/BaseText/RCTBaseTextViewManager.m
@@ -11,7 +11,7 @@
 
 RCT_EXPORT_MODULE(RCTBaseText)
 
-- (RCTUIView *)view // TODO(macOS ISS#3536887)
+- (UIView *)view
 {
   RCTAssert(NO, @"The `-[RCTBaseTextViewManager view]` property must be overridden in subclass.");
   return nil;
