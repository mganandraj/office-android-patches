--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\RawText\\RCTRawTextViewManager.m"	2020-01-30 13:55:47.988608700 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Text\\RawText\\RCTRawTextViewManager.m"	2020-01-29 14:10:08.992883100 -0800
@@ -13,9 +13,9 @@
 
 RCT_EXPORT_MODULE(RCTRawText)
 
-- (UIView *)view
+- (RCTUIView *)view // TODO(macOS ISS#3536887)
 {
-  return [UIView new];
+  return [RCTUIView new]; // TODO(macOS ISS#3536887)
 }
 
 - (RCTShadowView *)shadowView
