diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\RawText\\RCTRawTextViewManager.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\RawText\\RCTRawTextViewManager.m"
index 641f4e7..03d08fe 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\RawText\\RCTRawTextViewManager.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\RawText\\RCTRawTextViewManager.m"
@@ -13,9 +13,9 @@
 
 RCT_EXPORT_MODULE(RCTRawText)
 
-- (UIView *)view
+- (RCTUIView *)view // TODO(macOS ISS#3536887)
 {
-  return [UIView new];
+  return [RCTUIView new]; // TODO(macOS ISS#3536887)
 }
 
 - (RCTShadowView *)shadowView
