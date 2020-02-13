--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\RCTBaseTextInputShadowView.m"	2020-01-30 13:55:47.995610700 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\RCTBaseTextInputShadowView.m"	2020-01-29 14:10:08.998884600 -0800
@@ -163,7 +163,7 @@
 
   NSNumber *tag = self.reactTag;
 
-  [_bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
+  [_bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
     RCTBaseTextInputView *baseTextInputView = (RCTBaseTextInputView *)viewRegistry[tag];
     if (!baseTextInputView) {
       return;
@@ -225,8 +225,13 @@
   CGSize size = [_layoutManager usedRectForTextContainer:_textContainer].size;
 
   return (CGSize){
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     MAX(minimumSize.width, MIN(RCTCeilPixelValue(size.width), maximumSize.width)),
     MAX(minimumSize.height, MIN(RCTCeilPixelValue(size.height), maximumSize.height))
+#else // [TODO(macOS ISS#2323203)
+    MAX(minimumSize.width, MIN(RCTCeilPixelValue(size.width, [self scale]), maximumSize.width)),
+    MAX(minimumSize.height, MIN(RCTCeilPixelValue(size.height, [self scale]), maximumSize.height))
+#endif // ]TODO(macOS ISS#2323203)
   };
 }
 
