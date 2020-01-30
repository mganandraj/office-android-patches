diff --git a/E:/github/ms-react-native-forpatch/Libraries/Text/VirtualText/RCTVirtualTextViewManager.m b/E:/github/fb-react-native-forpatch/Libraries/Text/VirtualText/RCTVirtualTextViewManager.m
index ec82788a2..48eec5ff2 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Text/VirtualText/RCTVirtualTextViewManager.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/Text/VirtualText/RCTVirtualTextViewManager.m
@@ -13,9 +13,9 @@
 
 RCT_EXPORT_MODULE(RCTVirtualText)
 
-- (RCTUIView *)view // TODO(macOS ISS#3536887)
+- (UIView *)view
 {
-  return [RCTUIView new]; // TODO(macOS ISS#3536887)
+  return [UIView new];
 }
 
 - (RCTShadowView *)shadowView
