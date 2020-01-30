diff --git a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/RCTBaseTextInputShadowView.m b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/RCTBaseTextInputShadowView.m
index d73b3b258..c79d65e13 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/RCTBaseTextInputShadowView.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/RCTBaseTextInputShadowView.m
@@ -163,7 +163,7 @@
 
   NSNumber *tag = self.reactTag;
 
-  [_bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
+  [_bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
     RCTBaseTextInputView *baseTextInputView = (RCTBaseTextInputView *)viewRegistry[tag];
     if (!baseTextInputView) {
       return;
@@ -225,13 +225,8 @@
   CGSize size = [_layoutManager usedRectForTextContainer:_textContainer].size;
 
   return (CGSize){
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     MAX(minimumSize.width, MIN(RCTCeilPixelValue(size.width), maximumSize.width)),
     MAX(minimumSize.height, MIN(RCTCeilPixelValue(size.height), maximumSize.height))
-#else // [TODO(macOS ISS#2323203)
-    MAX(minimumSize.width, MIN(RCTCeilPixelValue(size.width, [self scale]), maximumSize.width)),
-    MAX(minimumSize.height, MIN(RCTCeilPixelValue(size.height, [self scale]), maximumSize.height))
-#endif // ]TODO(macOS ISS#2323203)
   };
 }
 
