diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\BaseText\\RCTBaseTextViewManager.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\BaseText\\RCTBaseTextViewManager.m"
index 247c636..de1c65a 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\BaseText\\RCTBaseTextViewManager.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\BaseText\\RCTBaseTextViewManager.m"
@@ -11,7 +11,7 @@
 
 RCT_EXPORT_MODULE(RCTBaseText)
 
-- (UIView *)view
+- (RCTUIView *)view // TODO(macOS ISS#3536887)
 {
   RCTAssert(NO, @"The `-[RCTBaseTextViewManager view]` property must be overridden in subclass.");
   return nil;
