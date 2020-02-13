--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\BaseText\\RCTBaseTextViewManager.m"	2020-01-30 13:55:47.985611500 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Text\\BaseText\\RCTBaseTextViewManager.m"	2020-01-29 14:10:08.988882800 -0800
@@ -11,7 +11,7 @@
 
 RCT_EXPORT_MODULE(RCTBaseText)
 
-- (UIView *)view
+- (RCTUIView *)view // TODO(macOS ISS#3536887)
 {
   RCTAssert(NO, @"The `-[RCTBaseTextViewManager view]` property must be overridden in subclass.");
   return nil;
