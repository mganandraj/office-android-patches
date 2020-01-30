diff --git a/E:/github/ms-react-native-forpatch/Libraries/Text/RawText/RCTRawTextViewManager.m b/E:/github/fb-react-native-forpatch/Libraries/Text/RawText/RCTRawTextViewManager.m
index 03d08fe25..641f4e7d3 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Text/RawText/RCTRawTextViewManager.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/Text/RawText/RCTRawTextViewManager.m
@@ -13,9 +13,9 @@
 
 RCT_EXPORT_MODULE(RCTRawText)
 
-- (RCTUIView *)view // TODO(macOS ISS#3536887)
+- (UIView *)view
 {
-  return [RCTUIView new]; // TODO(macOS ISS#3536887)
+  return [UIView new];
 }
 
 - (RCTShadowView *)shadowView
