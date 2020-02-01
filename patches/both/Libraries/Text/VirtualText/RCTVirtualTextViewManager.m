diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\VirtualText\\RCTVirtualTextViewManager.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\VirtualText\\RCTVirtualTextViewManager.m"
index 48eec5f..ec82788 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\VirtualText\\RCTVirtualTextViewManager.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\VirtualText\\RCTVirtualTextViewManager.m"
@@ -13,9 +13,9 @@
 
 RCT_EXPORT_MODULE(RCTVirtualText)
 
-- (UIView *)view
+- (RCTUIView *)view // TODO(macOS ISS#3536887)
 {
-  return [UIView new];
+  return [RCTUIView new]; // TODO(macOS ISS#3536887)
 }
 
 - (RCTShadowView *)shadowView
