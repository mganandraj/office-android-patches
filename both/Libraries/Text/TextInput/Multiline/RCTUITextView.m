diff --git a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/Multiline/RCTUITextView.m b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/Multiline/RCTUITextView.m
index f4933c7ba..96e7867c9 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/Multiline/RCTUITextView.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/Multiline/RCTUITextView.m
@@ -15,10 +15,8 @@
 
 @implementation RCTUITextView
 {
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   UILabel *_placeholderView;
   UITextView *_detachedTextView;
-#endif // TODO(macOS ISS#2323203)
   RCTBackedTextViewDelegateAdapter *_textInputDelegateAdapter;
 }
 
@@ -29,10 +27,10 @@ static UIFont *defaultPlaceholderFont()
   return [UIFont systemFontOfSize:17];
 }
 
-static RCTUIColor *defaultPlaceholderColor() // TODO(OSS Candidate ISS#2710739)
+static UIColor *defaultPlaceholderColor()
 {
   // Default placeholder color from UITextField.
-  return [RCTUIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22]; // TODO(OSS Candidate ISS#2710739)
+  return [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
 }
 
 - (instancetype)initWithFrame:(CGRect)frame
@@ -42,17 +40,12 @@ static RCTUIColor *defaultPlaceholderColor() // TODO(OSS Candidate ISS#2710739)
                                              selector:@selector(textDidChange)
                                                  name:UITextViewTextDidChangeNotification
                                                object:self];
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
+
     _placeholderView = [[UILabel alloc] initWithFrame:self.bounds];
     _placeholderView.isAccessibilityElement = NO;
     _placeholderView.numberOfLines = 0;
     _placeholderView.textColor = defaultPlaceholderColor();
     [self addSubview:_placeholderView];
-#else // [TODO(macOS ISS#2323203)
-    NSTextCheckingTypes checkingTypes = 0;
-    self.enabledTextCheckingTypes = checkingTypes;
-    self.insertionPointColor = [NSColor selectedControlColor];
-#endif // ]TODO(macOS ISS#2323203)
 
     _textInputDelegateAdapter = [[RCTBackedTextViewDelegateAdapter alloc] initWithTextView:self];
   }
@@ -98,78 +91,14 @@ static RCTUIColor *defaultPlaceholderColor() // TODO(OSS Candidate ISS#2710739)
 - (void)setPlaceholder:(NSString *)placeholder
 {
   _placeholder = placeholder;
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
-  _placeholderView.text = _placeholder;
   _placeholderView.attributedText = [[NSAttributedString alloc] initWithString:_placeholder ?: @"" attributes:[self placeholderEffectiveTextAttributes]];
-#else // [TODO(macOS ISS#2323203)
-  [self setNeedsDisplay:YES];
-#endif // ]TODO(macOS ISS#2323203)
 }
 
-- (void)setPlaceholderColor:(RCTUIColor *)placeholderColor // TODO(OSS Candidate ISS#2710739)
+- (void)setPlaceholderColor:(UIColor *)placeholderColor
 {
   _placeholderColor = placeholderColor;
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   _placeholderView.textColor = _placeholderColor ?: defaultPlaceholderColor();
-#else // [TODO(macOS ISS#2323203)
-  [self setNeedsDisplay:YES];
-#endif // ]TODO(macOS ISS#2323203)
-}
-
-#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
-- (void)setSelectionColor:(RCTUIColor *)selectionColor
-{
-  NSMutableDictionary *selectTextAttributes = self.selectedTextAttributes.mutableCopy;
-  selectTextAttributes[NSBackgroundColorAttributeName] = selectionColor ?: [NSColor selectedControlColor];
-  self.selectedTextAttributes = selectTextAttributes.copy;
-  self.insertionPointColor = self.selectionColor ?: [NSColor selectedControlColor];
-}
-
-- (RCTUIColor*)selectionColor
-{
-  return (RCTUIColor*)self.selectedTextAttributes[NSBackgroundColorAttributeName];
-}
-
-- (void)setEnabledTextCheckingTypes:(NSTextCheckingTypes)checkingType
-{
-  [super setEnabledTextCheckingTypes:checkingType];
-  self.automaticDataDetectionEnabled = checkingType != 0;
-}
-
-- (NSTextAlignment)textAlignment
-{
-  return self.alignment;
-}
-
-- (NSString*)text
-{
-  return self.string;
-}
-
-- (void)setText:(NSString *)text
-{
-  self.string = text;
-}
-
-- (NSAttributedString*)attributedText
-{
-  return self.textStorage;
-}
-
-- (BOOL)becomeFirstResponder
-{
-  BOOL success =  [[self window] makeFirstResponder:self];
-
-  if (success) {
-    id<RCTBackedTextInputDelegate> textInputDelegate = [self textInputDelegate];
-    if ([textInputDelegate respondsToSelector:@selector(textInputDidBeginEditing)]) {
-      [textInputDelegate textInputDidBeginEditing];
-    }
-  }
-
-  return success;
 }
-#endif // ]TODO(macOS ISS#2323203)
 
 - (void)setReactTextAttributes:(RCTTextAttributes *)reactTextAttributes
 {
@@ -198,27 +127,17 @@ static RCTUIColor *defaultPlaceholderColor() // TODO(OSS Candidate ISS#2710739)
 - (void)setFont:(UIFont *)font
 {
   [super setFont:font];
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   _placeholderView.font = font ?: defaultPlaceholderFont();
-#else // [TODO(macOS ISS#2323203)
-  [self setNeedsDisplay:YES];
-#endif // ]TODO(macOS ISS#2323203)
 }
 
 - (void)setTextAlignment:(NSTextAlignment)textAlignment
 {
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   [super setTextAlignment:textAlignment];
   _placeholderView.textAlignment = textAlignment;
-#else // [TODO(macOS ISS#2323203)
-  self.alignment = textAlignment;
-  [self setNeedsDisplay:YES];
-#endif // ]TODO(macOS ISS#2323203)
 }
 
 - (void)setAttributedText:(NSAttributedString *)attributedText
 {
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   // Using `setAttributedString:` while user is typing breaks some internal mechanics
   // when entering complex input languages such as Chinese, Korean or Japanese.
   // see: https://github.com/facebook/react-native/issues/19339
@@ -235,18 +154,11 @@ static RCTUIColor *defaultPlaceholderColor() // TODO(OSS Candidate ISS#2710739)
   }
 
   [self textDidChange];
-#else // [TODO(macOS ISS#2323203)
-  [self.textStorage setAttributedString:attributedText];
-#endif // ]TODO(macOS ISS#2323203)
 }
 
 #pragma mark - Overrides
 
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (void)setSelectedTextRange:(UITextRange *)selectedTextRange notifyDelegate:(BOOL)notifyDelegate
-#else // [TODO(macOS ISS#2323203)
-- (void)setSelectedTextRange:(NSRange)selectedTextRange notifyDelegate:(BOOL)notifyDelegate
-#endif // ]TODO(macOS ISS#2323203)
 {
   if (!notifyDelegate) {
     // We have to notify an adapter that following selection change was initiated programmatically,
@@ -254,19 +166,8 @@ static RCTUIColor *defaultPlaceholderColor() // TODO(OSS Candidate ISS#2710739)
     [_textInputDelegateAdapter skipNextTextInputDidChangeSelectionEventWithTextRange:selectedTextRange];
   }
 
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   [super setSelectedTextRange:selectedTextRange];
-#else // [TODO(macOS ISS#2323203)
-  [super setSelectedRange:selectedTextRange];
-#endif // ]TODO(macOS ISS#2323203)
-}
-
-#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
-- (NSRange)selectedTextRange
-{
-  return [super selectedRange];
 }
-#endif // ]TODO(macOS ISS#2323203)
 
 - (void)paste:(id)sender
 {
@@ -274,68 +175,12 @@ static RCTUIColor *defaultPlaceholderColor() // TODO(OSS Candidate ISS#2710739)
   _textWasPasted = YES;
 }
 
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (void)setContentOffset:(CGPoint)contentOffset animated:(__unused BOOL)animated
 {
   // Turning off scroll animation.
   // This fixes the problem also known as "flaky scrolling".
   [super setContentOffset:contentOffset animated:NO];
 }
-#endif // [TODO(macOS ISS#2323203)
-
-#if TARGET_OS_OSX
-
-#pragma mark - Placeholder
-
-- (NSAttributedString*)placeholderTextAttributedString
-{
-  if (self.placeholder == nil) {
-    return nil;
-  }
-  NSMutableDictionary *placeholderAttributes = [self.typingAttributes mutableCopy];
-  if (placeholderAttributes == nil) {
-    placeholderAttributes = [NSMutableDictionary dictionary];
-  }
-  placeholderAttributes[NSForegroundColorAttributeName] = self.placeholderColor ?: defaultPlaceholderColor();
-  placeholderAttributes[NSFontAttributeName] = self.font ?: defaultPlaceholderFont();
-  return [[NSAttributedString alloc] initWithString:self.placeholder attributes:placeholderAttributes];
-}
-
-- (void)drawRect:(NSRect)dirtyRect
-{
-  [super drawRect:dirtyRect];
-  
-  if (self.text.length == 0 && self.placeholder) {
-    NSAttributedString *attributedPlaceholderString = self.placeholderTextAttributedString;
-    
-    if (attributedPlaceholderString) {
-      NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:attributedPlaceholderString];
-      NSTextContainer *textContainer = [[NSTextContainer alloc] initWithContainerSize:self.textContainer.containerSize];
-      NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
-      
-      textContainer.lineFragmentPadding = self.textContainer.lineFragmentPadding;
-      [layoutManager addTextContainer:textContainer];
-      [textStorage addLayoutManager:layoutManager];
-      
-      NSRange glyphRange = [layoutManager glyphRangeForTextContainer:textContainer];
-      [layoutManager drawGlyphsForGlyphRange:glyphRange atPoint:self.textContainerOrigin];
-    }
-  }
-}
-
-#pragma mark - Text Insets
-
-- (void)setTextContainerInsets:(UIEdgeInsets)textContainerInsets
-{
-  // NSTextView             has a NSSize       textContainerInset  property
-  // UITextview             has a UIEdgeInsets textContainerInset  property
-  // RCTUITextView mac only has a UIEdgeInsets textContainerInsets property
-  // UI/NSTextField do NOT have textContainerInset properties
-  _textContainerInsets = textContainerInsets;
-  super.textContainerInset = NSMakeSize(MIN(textContainerInsets.left, textContainerInsets.right), MIN(textContainerInsets.top, textContainerInsets.bottom));
-}
-
-#endif // ]TODO(macOS ISS#2323203)
 
 #pragma mark - Layout
 
@@ -347,22 +192,11 @@ static RCTUIColor *defaultPlaceholderColor() // TODO(OSS Candidate ISS#2710739)
 
 - (CGSize)placeholderSize
 {
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   UIEdgeInsets textContainerInset = self.textContainerInset;
-#else // [TODO(macOS ISS#2323203)
-  UIEdgeInsets textContainerInset = self.textContainerInsets;
-#endif // ]TODO(macOS ISS#2323203)
   NSString *placeholder = self.placeholder ?: @"";
-  
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   CGSize maxPlaceholderSize = CGSizeMake(UIEdgeInsetsInsetRect(self.bounds, textContainerInset).size.width, CGFLOAT_MAX);
   CGSize placeholderSize = [placeholder boundingRectWithSize:maxPlaceholderSize options:NSStringDrawingUsesLineFragmentOrigin attributes:[self placeholderEffectiveTextAttributes] context:nil].size;
   placeholderSize = CGSizeMake(RCTCeilPixelValue(placeholderSize.width), RCTCeilPixelValue(placeholderSize.height));
-#else // [TODO(macOS ISS#2323203)
-  CGFloat scale = self.window.backingScaleFactor;
-  CGSize placeholderSize = [placeholder sizeWithAttributes:@{NSFontAttributeName: self.font ?: defaultPlaceholderFont()}];
-  placeholderSize = CGSizeMake(RCTCeilPixelValue(placeholderSize.width, scale), RCTCeilPixelValue(placeholderSize.height, scale));
-#endif // ]TODO(macOS ISS#2323203)
   placeholderSize.width += textContainerInset.left + textContainerInset.right;
   placeholderSize.height += textContainerInset.top + textContainerInset.bottom;
   // Returning size DOES contain `textContainerInset` (aka `padding`; as `sizeThatFits:` does).
@@ -371,13 +205,8 @@ static RCTUIColor *defaultPlaceholderColor() // TODO(OSS Candidate ISS#2710739)
 
 - (CGSize)contentSize
 {
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   CGSize contentSize = super.contentSize;
   CGSize placeholderSize = _placeholderView.isHidden ? CGSizeZero : self.placeholderSize;
-#else // [TODO(macOS ISS#2323203)
-  CGSize contentSize = super.intrinsicContentSize;
-  CGSize placeholderSize = self.placeholderSize;
-#endif // ]TODO(macOS ISS#2323203)
   // When a text input is empty, it actually displays a placehoder.
   // So, we have to consider `placeholderSize` as a minimum `contentSize`.
   // Returning size DOES contain `textContainerInset` (aka `padding`).
@@ -386,7 +215,6 @@ static RCTUIColor *defaultPlaceholderColor() // TODO(OSS Candidate ISS#2710739)
     MAX(contentSize.height, placeholderSize.height));
 }
 
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (void)layoutSubviews
 {
   [super layoutSubviews];
@@ -396,7 +224,6 @@ static RCTUIColor *defaultPlaceholderColor() // TODO(OSS Candidate ISS#2710739)
   textFrame.size.height = MIN(placeholderHeight, textFrame.size.height);
   _placeholderView.frame = textFrame;
 }
-#endif // TODO(macOS ISS#2323203)
 
 - (CGSize)intrinsicContentSize
 {
@@ -407,13 +234,7 @@ static RCTUIColor *defaultPlaceholderColor() // TODO(OSS Candidate ISS#2710739)
 - (CGSize)sizeThatFits:(CGSize)size
 {
   // Returned fitting size depends on text size and placeholder size.
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   CGSize textSize = [super sizeThatFits:size];
-#else
-  [self.layoutManager glyphRangeForTextContainer:self.textContainer];
-  NSRect rect = [self.layoutManager usedRectForTextContainer:self.textContainer];
-  CGSize textSize = CGSizeMake(MIN(rect.size.width, size.width), rect.size.height);
-#endif // TODO(macOS ISS#2323203)
   CGSize placeholderSize = self.placeholderSize;
   // Returning size DOES contain `textContainerInset` (aka `padding`).
   return CGSizeMake(MAX(textSize.width, placeholderSize.width), MAX(textSize.height, placeholderSize.height));
@@ -421,7 +242,6 @@ static RCTUIColor *defaultPlaceholderColor() // TODO(OSS Candidate ISS#2710739)
 
 #pragma mark - Context Menu
 
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (BOOL)canPerformAction:(SEL)action withSender:(id)sender
 {
   if (_contextMenuHidden) {
@@ -430,28 +250,14 @@ static RCTUIColor *defaultPlaceholderColor() // TODO(OSS Candidate ISS#2710739)
 
   return [super canPerformAction:action withSender:sender];
 }
-#endif // TODO(macOS ISS#2323203)
 
 #pragma mark - Placeholder
 
 - (void)invalidatePlaceholderVisibility
 {
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   BOOL isVisible = _placeholder.length != 0 && self.attributedText.length == 0;
   _placeholderView.hidden = !isVisible;
-#else // [TODO(macOS ISS#2323203)
-  [self setNeedsDisplay:YES];
-#endif // ]TODO(macOS ISS#2323203)
-}
-
-#if !TARGET_OS_OSX // [TODO(OSS Candidate ISS#2710739)
-- (void)deleteBackward {
-  id<RCTBackedTextInputDelegate> textInputDelegate = [self textInputDelegate];
-  if ([textInputDelegate textInputShouldHandleDeleteBackward:self]) {
-    [super deleteBackward];
-  }
 }
-#endif // ]TODO(OSS Candidate ISS#2710739)
 
 - (NSDictionary<NSAttributedStringKey, id> *)placeholderEffectiveTextAttributes
 {
