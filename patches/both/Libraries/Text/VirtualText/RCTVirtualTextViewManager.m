--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\VirtualText\\RCTVirtualTextViewManager.m"	2020-01-30 13:55:48.002612000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\VirtualText\\RCTVirtualTextViewManager.m"	2020-01-29 14:10:09.005914400 -0800
@@ -13,9 +13,9 @@
 
 RCT_EXPORT_MODULE(RCTVirtualText)
 
-- (UIView *)view
+- (RCTUIView *)view // TODO(macOS ISS#3536887)
 {
-  return [UIView new];
+  return [RCTUIView new]; // TODO(macOS ISS#3536887)
 }
 
 - (RCTShadowView *)shadowView
