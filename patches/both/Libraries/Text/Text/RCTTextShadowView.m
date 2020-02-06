--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\Text\\RCTTextShadowView.m"	2020-01-30 13:55:47.990609500 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\Text\\RCTTextShadowView.m"	2020-01-29 14:10:08.994914500 -0800
@@ -99,16 +99,16 @@
    }
   ];
 
-  [_bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *, UIView *> *viewRegistry) {
+  [_bridge.uiManager addUIBlock:^(RCTUIManager *uiManager, NSDictionary<NSNumber *, RCTUIView *> *viewRegistry) { // TODO(macOS ISS#3536887)
     RCTTextView *textView = (RCTTextView *)viewRegistry[tag];
     if (!textView) {
       return;
     }
 
-    NSMutableArray<UIView *> *descendantViews =
+    NSMutableArray<RCTUIView *> *descendantViews = // TODO(macOS ISS#3536887)
       [NSMutableArray arrayWithCapacity:descendantViewTags.count];
     [descendantViewTags enumerateObjectsUsingBlock:^(NSNumber *_Nonnull descendantViewTag, NSUInteger index, BOOL *_Nonnull stop) {
-      UIView *descendantView = viewRegistry[descendantViewTag];
+      RCTUIView *descendantView = viewRegistry[descendantViewTag]; // TODO(macOS ISS#3536887)
       if (!descendantView) {
         return;
       }
@@ -147,7 +147,7 @@
     return;
   }
 
-  __block CGFloat maximumFontLineHeight = 0;
+  [attributedText beginEditing];
 
   [attributedText enumerateAttribute:NSFontAttributeName
                              inRange:NSMakeRange(0, attributedText.length)
@@ -158,21 +158,18 @@
         return;
       }
 
-      if (maximumFontLineHeight <= font.lineHeight) {
-        maximumFontLineHeight = font.lineHeight;
+      if (maximumLineHeight <= UIFontLineHeight(font)) { // TODO(macOS ISS#2323203)
+        return;
       }
-    }
-  ];
 
-  if (maximumLineHeight < maximumFontLineHeight) {
-    return;
-  }
-
-  CGFloat baseLineOffset = maximumLineHeight / 2.0 - maximumFontLineHeight / 2.0;
+      CGFloat baseLineOffset = maximumLineHeight / 2.0 - UIFontLineHeight(font) / 2.0; // TODO(macOS ISS#2323203)
 
-  [attributedText addAttribute:NSBaselineOffsetAttributeName
-                         value:@(baseLineOffset)
-                         range:NSMakeRange(0, attributedText.length)];
+      [attributedText addAttribute:NSBaselineOffsetAttributeName
+                             value:@(baseLineOffset)
+                             range:range];
+     }];
+  
+  [attributedText endEditing];
 }
 
 - (NSAttributedString *)attributedTextWithMeasuredAttachmentsThatFitSize:(CGSize)size
@@ -207,7 +204,7 @@
 - (NSTextStorage *)textStorageAndLayoutManagerThatFitsSize:(CGSize)size
                                         exclusiveOwnership:(BOOL)exclusiveOwnership
 {
-  NSValue *key = [NSValue valueWithCGSize:size];
+  NSValue *key = NSValueWithCGSize(size); // TODO(macOS ISS#2323203)
   NSTextStorage *cachedTextStorage = [_cachedTextStorages objectForKey:key];
 
   if (cachedTextStorage) {
@@ -298,11 +295,21 @@
       UIFont *font = [textStorage attribute:NSFontAttributeName atIndex:range.location effectiveRange:nil];
 
       CGRect frame = {{
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
         RCTRoundPixelValue(glyphRect.origin.x),
         RCTRoundPixelValue(glyphRect.origin.y + glyphRect.size.height - attachmentSize.height + font.descender)
+#else // [TODO(macOS ISS#2323203)
+        RCTRoundPixelValue(glyphRect.origin.x, [self scale]),
+        RCTRoundPixelValue(glyphRect.origin.y + glyphRect.size.height - attachmentSize.height + font.descender, [self scale])
+#endif // ]TODO(macOS ISS#2323203)
       }, {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
         RCTRoundPixelValue(attachmentSize.width),
         RCTRoundPixelValue(attachmentSize.height)
+#else // [TODO(macOS ISS#2323203)
+        RCTRoundPixelValue(attachmentSize.width, [self scale]),
+        RCTRoundPixelValue(attachmentSize.height, [self scale])
+#endif // ]TODO(macOS ISS#2323203)
       }};
       
       NSRange truncatedGlyphRange = [layoutManager truncatedGlyphRangeInLineFragmentForGlyphAtIndex:range.location];
@@ -401,8 +408,13 @@
   }
 
   size = (CGSize){
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     MIN(RCTCeilPixelValue(size.width), maximumSize.width),
     MIN(RCTCeilPixelValue(size.height), maximumSize.height)
+#else // [TODO(macOS ISS#2323203)
+    MIN(RCTCeilPixelValue(size.width, shadowTextView.scale), maximumSize.width),
+    MIN(RCTCeilPixelValue(size.height, shadowTextView.scale), maximumSize.height)
+#endif // ]TODO(macOS ISS#2323203)
   };
 
   // Adding epsilon value illuminates problems with converting values from
