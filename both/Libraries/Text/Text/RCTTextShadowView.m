diff --git a/E:/github/ms-react-native-forpatch/Libraries/Text/Text/RCTTextShadowView.m b/E:/github/fb-react-native-forpatch/Libraries/Text/Text/RCTTextShadowView.m
index 6c793bc86..a1243e324 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Text/Text/RCTTextShadowView.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/Text/Text/RCTTextShadowView.m
@@ -99,16 +99,16 @@
    }
   ];
 
-  [_bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
+  [_bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
     RCTTextView *textView = (RCTTextView *)viewRegistry[tag];
     if (!textView) {
       return;
     }
 
-    NSMutableArray<RCTUIView *> *descendantViews = // TODO(macOS ISS#3536887)
+    NSMutableArray<UIView *> *descendantViews =
       [NSMutableArray arrayWithCapacity:descendantViewTags.count];
     [descendantViewTags enumerateObjectsUsingBlock:^(NSNumber *_Nonnull descendantViewTag, NSUInteger index, BOOL *_Nonnull stop) {
-      RCTUIView *descendantView = viewRegistry[descendantViewTag]; // TODO(macOS ISS#3536887)
+      UIView *descendantView = viewRegistry[descendantViewTag];
       if (!descendantView) {
         return;
       }
@@ -147,7 +147,7 @@
     return;
   }
 
-  [attributedText beginEditing];
+  __block CGFloat maximumFontLineHeight = 0;
 
   [attributedText enumerateAttribute:NSFontAttributeName
                              inRange:NSMakeRange(0, attributedText.length)
@@ -158,18 +158,21 @@
         return;
       }
 
-      if (maximumLineHeight <= UIFontLineHeight(font)) { // TODO(macOS ISS#2323203)
-        return;
+      if (maximumFontLineHeight <= font.lineHeight) {
+        maximumFontLineHeight = font.lineHeight;
       }
+    }
+  ];
 
-      CGFloat baseLineOffset = maximumLineHeight / 2.0 - UIFontLineHeight(font) / 2.0; // TODO(macOS ISS#2323203)
+  if (maximumLineHeight < maximumFontLineHeight) {
+    return;
+  }
 
-      [attributedText addAttribute:NSBaselineOffsetAttributeName
-                             value:@(baseLineOffset)
-                             range:range];
-     }];
-  
-  [attributedText endEditing];
+  CGFloat baseLineOffset = maximumLineHeight / 2.0 - maximumFontLineHeight / 2.0;
+
+  [attributedText addAttribute:NSBaselineOffsetAttributeName
+                         value:@(baseLineOffset)
+                         range:NSMakeRange(0, attributedText.length)];
 }
 
 - (NSAttributedString *)attributedTextWithMeasuredAttachmentsThatFitSize:(CGSize)size
@@ -204,7 +207,7 @@
 - (NSTextStorage *)textStorageAndLayoutManagerThatFitsSize:(CGSize)size
                                         exclusiveOwnership:(BOOL)exclusiveOwnership
 {
-  NSValue *key = NSValueWithCGSize(size); // TODO(macOS ISS#2323203)
+  NSValue *key = [NSValue valueWithCGSize:size];
   NSTextStorage *cachedTextStorage = [_cachedTextStorages objectForKey:key];
 
   if (cachedTextStorage) {
@@ -295,21 +298,11 @@
       UIFont *font = [textStorage attribute:NSFontAttributeName atIndex:range.location effectiveRange:nil];
 
       CGRect frame = {{
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
         RCTRoundPixelValue(glyphRect.origin.x),
         RCTRoundPixelValue(glyphRect.origin.y + glyphRect.size.height - attachmentSize.height + font.descender)
-#else // [TODO(macOS ISS#2323203)
-        RCTRoundPixelValue(glyphRect.origin.x, [self scale]),
-        RCTRoundPixelValue(glyphRect.origin.y + glyphRect.size.height - attachmentSize.height + font.descender, [self scale])
-#endif // ]TODO(macOS ISS#2323203)
       }, {
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
         RCTRoundPixelValue(attachmentSize.width),
         RCTRoundPixelValue(attachmentSize.height)
-#else // [TODO(macOS ISS#2323203)
-        RCTRoundPixelValue(attachmentSize.width, [self scale]),
-        RCTRoundPixelValue(attachmentSize.height, [self scale])
-#endif // ]TODO(macOS ISS#2323203)
       }};
       
       NSRange truncatedGlyphRange = [layoutManager truncatedGlyphRangeInLineFragmentForGlyphAtIndex:range.location];
@@ -408,13 +401,8 @@ static YGSize RCTTextShadowViewMeasure(YGNodeRef node, float width, YGMeasureMod
   }
 
   size = (CGSize){
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     MIN(RCTCeilPixelValue(size.width), maximumSize.width),
     MIN(RCTCeilPixelValue(size.height), maximumSize.height)
-#else // [TODO(macOS ISS#2323203)
-    MIN(RCTCeilPixelValue(size.width, shadowTextView.scale), maximumSize.width),
-    MIN(RCTCeilPixelValue(size.height, shadowTextView.scale), maximumSize.height)
-#endif // ]TODO(macOS ISS#2323203)
   };
 
   // Adding epsilon value illuminates problems with converting values from
