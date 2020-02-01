diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\Singleline\\RCTUITextField.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\Singleline\\RCTUITextField.m"
index 3d1af3d..4c86eeb 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\Singleline\\RCTUITextField.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\Singleline\\RCTUITextField.m"
@@ -11,22 +11,105 @@
 #import <React/UIView+React.h>
 
 #import "RCTBackedTextInputDelegateAdapter.h"
+#import "RCTBackedTextInputDelegate.h" // TODO(OSS Candidate ISS#2710739)
 #import "RCTTextAttributes.h"
 
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+@interface RCTUITextFieldCell : NSTextFieldCell
+
+@property (nonatomic, assign) UIEdgeInsets textContainerInset;
+@property (nonatomic, getter=isAutomaticTextReplacementEnabled) BOOL automaticTextReplacementEnabled;
+@property (nonatomic, getter=isAutomaticSpellingCorrectionEnabled) BOOL automaticSpellingCorrectionEnabled;
+@property (nonatomic, strong, nullable) RCTUIColor *selectionColor;
+
+@end
+
+@implementation RCTUITextFieldCell
+
+- (void)setTextContainerInset:(UIEdgeInsets)textContainerInset
+{
+  _textContainerInset = textContainerInset;
+}
+
+- (NSRect)titleRectForBounds:(NSRect)rect
+{
+  return UIEdgeInsetsInsetRect([super titleRectForBounds:rect], self.textContainerInset);
+}
+
+- (void)editWithFrame:(NSRect)rect inView:(NSView *)controlView editor:(NSText *)textObj delegate:(id)delegate event:(NSEvent *)event
+{
+  [super editWithFrame:[self titleRectForBounds:rect] inView:controlView editor:textObj delegate:delegate event:event];
+}
+
+- (void)selectWithFrame:(NSRect)rect inView:(NSView *)controlView editor:(NSText *)textObj delegate:(id)delegate start:(NSInteger)selStart length:(NSInteger)selLength
+{
+  [super selectWithFrame:[self titleRectForBounds:rect] inView:controlView editor:textObj delegate:delegate start:selStart length:selLength];
+}
+
+- (void)drawInteriorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
+{
+  if (self.drawsBackground) {
+    if (self.backgroundColor && self.backgroundColor.alphaComponent > 0) {
+      
+      [self.backgroundColor set];
+      NSRectFill(cellFrame);
+    }
+  }
+  
+  [super drawInteriorWithFrame:[self titleRectForBounds:cellFrame] inView:controlView];
+}
+
+- (NSText *)setUpFieldEditorAttributes:(NSText *)textObj
+{
+  NSTextView *fieldEditor = (NSTextView *)[super setUpFieldEditorAttributes:textObj];
+  fieldEditor.automaticSpellingCorrectionEnabled = self.isAutomaticSpellingCorrectionEnabled;
+  fieldEditor.automaticTextReplacementEnabled = self.isAutomaticTextReplacementEnabled;
+  NSMutableDictionary *selectTextAttributes = fieldEditor.selectedTextAttributes.mutableCopy;
+  selectTextAttributes[NSBackgroundColorAttributeName] = self.selectionColor ?: [NSColor selectedControlColor];
+	fieldEditor.selectedTextAttributes = selectTextAttributes;
+  fieldEditor.insertionPointColor = self.selectionColor ?: [RCTUIColor selectedControlColor];
+  return fieldEditor;
+}
+
+@end
+#endif // ]TODO(macOS ISS#2323203)
+
 @implementation RCTUITextField {
   RCTBackedTextFieldDelegateAdapter *_textInputDelegateAdapter;
 }
 
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+@dynamic delegate;
+
+static UIFont *defaultPlaceholderFont()
+{
+  return [UIFont systemFontOfSize:17];
+}
+
+static RCTUIColor *defaultPlaceholderTextColor()
+{
+  // Default placeholder color from UITextField.
+  return [RCTUIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22];
+}
+
+#endif // ]TODO(macOS ISS#2323203)
+
 @synthesize reactTextAttributes = _reactTextAttributes;
 
 - (instancetype)initWithFrame:(CGRect)frame
 {
   if (self = [super initWithFrame:frame]) {
+        
     [[NSNotificationCenter defaultCenter] addObserver:self
                                              selector:@selector(_textDidChange)
                                                  name:UITextFieldTextDidChangeNotification
                                                object:self];
 
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+    self.bordered = NO;
+    self.accessibilityRole = NSAccessibilityTextFieldRole;
+#endif // ]TODO(macOS ISS#2323203)
+
     _textInputDelegateAdapter = [[RCTBackedTextFieldDelegateAdapter alloc] initWithTextField:self];
   }
 
@@ -57,27 +140,115 @@
 - (void)setTextContainerInset:(UIEdgeInsets)textContainerInset
 {
   _textContainerInset = textContainerInset;
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   [self setNeedsLayout];
+#else // [TODO(macOS ISS#2323203)
+  ((RCTUITextFieldCell*)self.cell).textContainerInset = _textContainerInset;
+#endif // ]TODO(macOS ISS#2323203)
+}
+
+#if TARGET_OS_OSX // TODO(macOS ISS#2323203)
+
++ (Class)cellClass
+{
+  return RCTUITextFieldCell.class;
+}
+
+- (void)setAttributedText:(NSAttributedString *)attributedText
+{
+  self.attributedStringValue = attributedText;
+}
+
+- (NSAttributedString *)attributedText
+{
+  return self.attributedStringValue;
+}
+
+- (void)setText:(NSString *)text
+{
+  self.stringValue = text;
 }
 
+- (NSString*)text
+{
+  return self.stringValue;
+}
+
+- (void)setAutomaticTextReplacementEnabled:(BOOL)automaticTextReplacementEnabled
+{
+  ((RCTUITextFieldCell*)self.cell).automaticTextReplacementEnabled = automaticTextReplacementEnabled;
+}
+
+- (BOOL)isAutomaticTextReplacementEnabled
+{
+  return ((RCTUITextFieldCell*)self.cell).isAutomaticTextReplacementEnabled;
+}
+
+- (void)setAutomaticSpellingCorrectionEnabled:(BOOL)automaticSpellingCorrectionEnabled
+{
+  ((RCTUITextFieldCell*)self.cell).automaticSpellingCorrectionEnabled = automaticSpellingCorrectionEnabled;
+}
+
+- (BOOL)isAutomaticSpellingCorrectionEnabled
+{
+  return ((RCTUITextFieldCell*)self.cell).isAutomaticSpellingCorrectionEnabled;
+}
+
+- (void)setSelectionColor:(RCTUIColor *)selectionColor // TODO(OSS Candidate ISS#2710739)
+{
+  ((RCTUITextFieldCell*)self.cell).selectionColor = selectionColor;
+}
+
+- (RCTUIColor*)selectionColor // TODO(OSS Candidate ISS#2710739)
+{
+  return ((RCTUITextFieldCell*)self.cell).selectionColor;
+}
+
+- (void)setFont:(UIFont *)font
+{
+  ((RCTUITextFieldCell*)self.cell).font = font;
+}
+
+- (UIFont *)font
+{
+  return ((RCTUITextFieldCell*)self.cell).font;
+}
+
+#endif // ]TODO(macOS ISS#2323203)
+
 - (void)setPlaceholder:(NSString *)placeholder
 {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   [super setPlaceholder:placeholder];
+#else // [TODO(macOS ISS#2323203)
+  [super setPlaceholderString:placeholder];
+#endif // ]TODO(macOS ISS#2323203)
   [self _updatePlaceholder];
 }
 
-- (void)setPlaceholderColor:(UIColor *)placeholderColor
+- (void)setPlaceholderColor:(RCTUIColor *)placeholderColor // TODO(OSS Candidate ISS#2710739)
 {
   _placeholderColor = placeholderColor;
   [self _updatePlaceholder];
 }
 
+- (NSString*)placeholder // [TODO(macOS ISS#2323203)
+{
+#if !TARGET_OS_OSX 
+  return super.placeholder;
+#else
+  return self.placeholderAttributedString.string ?: self.placeholderString;
+#endif
+} // ]TODO(macOS ISS#2323203)
+
 - (void)setReactTextAttributes:(RCTTextAttributes *)reactTextAttributes
 {
   if ([reactTextAttributes isEqual:_reactTextAttributes]) {
     return;
   }
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   self.defaultTextAttributes = reactTextAttributes.effectiveTextAttributes;
+#endif // TODO(macOS ISS#2323203)
   _reactTextAttributes = reactTextAttributes;
   [self _updatePlaceholder];
 }
@@ -93,8 +264,21 @@
     return;
   }
 
+  NSMutableDictionary *attributes = [NSMutableDictionary new];
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
+  if (_placeholderColor) {
+    [attributes setObject:_placeholderColor forKey:NSForegroundColorAttributeName];
+  }
+
   self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder
-                                                               attributes:[self placeholderEffectiveTextAttributes]];
+                                                               attributes:attributes];
+#else // [TODO(macOS ISS#2323203)
+  attributes[NSForegroundColorAttributeName] = _placeholderColor ?: defaultPlaceholderTextColor();
+  attributes[NSFontAttributeName] = self.font ?: defaultPlaceholderFont();
+  
+  self.placeholderAttributedString = [[NSAttributedString alloc] initWithString:self.placeholder
+                                                                     attributes:attributes];
+#endif // ]TODO(macOS ISS#2323203)
 }
 
 - (BOOL)isEditable
@@ -104,9 +288,15 @@
 
 - (void)setEditable:(BOOL)editable
 {
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+  // on macos the super must be called otherwise its NSTextFieldCell editable property doesn't get set.
+  [super setEditable:editable];
+#endif // ]TODO(macOS ISS#2323203)
   self.enabled = editable;
 }
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
+
 - (void)setScrollEnabled:(BOOL)enabled
 {
   // Do noting, compatible with multiline textinput
@@ -173,9 +363,85 @@
 {
   return [self textRectForBounds:bounds];
 }
+  
+#else // [TODO(macOS ISS#2323203)
+  
+#pragma mark - NSTextViewDelegate methods
+
+- (void)setScrollEnabled:(BOOL)enabled
+{
+  // Do noting, compatible with multiline textinput
+}
+
+- (BOOL)scrollEnabled
+{
+  return NO;
+}
+
+- (void)textDidChange:(NSNotification *)notification
+{
+  [super textDidChange:notification];
+  id<RCTUITextFieldDelegate> delegate = self.delegate;
+  if ([delegate respondsToSelector:@selector(textFieldDidChange:)]) {
+    [delegate textFieldDidChange:self];
+  }
+}
+  
+- (void)textDidEndEditing:(NSNotification *)notification
+{
+  [super textDidEndEditing:notification];    
+  id<RCTUITextFieldDelegate> delegate = self.delegate;
+  if ([delegate respondsToSelector:@selector(textFieldEndEditing:)]) {
+    [delegate textFieldEndEditing:self];
+  }
+}
+  
+- (void)textViewDidChangeSelection:(NSNotification *)notification
+{
+  id<RCTUITextFieldDelegate> delegate = self.delegate;
+  if ([delegate respondsToSelector:@selector(textFieldDidChangeSelection:)]) {
+    [delegate textFieldDidChangeSelection:self];
+  }
+}
+
+- (BOOL)textView:(NSTextView *)aTextView shouldChangeTextInRange:(NSRange)aRange replacementString:(NSString *)aString
+{
+  id<RCTUITextFieldDelegate> delegate = self.delegate;
+  if ([delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
+    return [delegate textField:self shouldChangeCharactersInRange:aRange replacementString:aString];
+  }
+  return NO;
+}
+  
+#endif // ]TODO(macOS ISS#2323203)
 
 #pragma mark - Overrides
 
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+- (BOOL)becomeFirstResponder
+{
+  BOOL isFirstResponder = [super becomeFirstResponder];
+  if (isFirstResponder) {
+    id<RCTUITextFieldDelegate> delegate = self.delegate;
+    if ([delegate respondsToSelector:@selector(textFieldBeginEditing:)]) {
+      // The AppKit -[NSTextField textDidBeginEditing:] notification is only called when the user
+      // makes the first change to the text in the text field.
+      // The react-native -[RCTUITextFieldDelegate textFieldBeginEditing:] is intended to be
+      // called when the text field is focused so call it here in becomeFirstResponder.
+      [delegate textFieldBeginEditing:self];
+    }
+
+    NSScrollView *scrollView = [self enclosingScrollView];
+    if (scrollView != nil) {
+      NSRect visibleRect = [[scrollView documentView] convertRect:self.frame fromView:self];
+      [[scrollView documentView] scrollRectToVisible:visibleRect];
+    }
+  }
+  return isFirstResponder;
+}
+#endif // ]TODO(macOS ISS#2323203)
+	
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (void)setSelectedTextRange:(UITextRange *)selectedTextRange notifyDelegate:(BOOL)notifyDelegate
 {
   if (!notifyDelegate) {
@@ -192,6 +458,23 @@
   [super paste:sender];
   _textWasPasted = YES;
 }
+#else // [TODO(macOS ISS#2323203)
+- (void)setSelectedTextRange:(NSRange)selectedTextRange notifyDelegate:(BOOL)notifyDelegate
+{
+  if (!notifyDelegate) {
+    // We have to notify an adapter that following selection change was initiated programmatically,
+    // so the adapter must not generate a notification for it.
+    [_textInputDelegateAdapter skipNextTextInputDidChangeSelectionEventWithTextRange:selectedTextRange];
+  }
+  
+  [[self currentEditor] setSelectedRange:selectedTextRange];
+}
+
+- (NSRange)selectedTextRange
+{
+  return [[self currentEditor] selectedRange];
+}
+#endif // ]TODO(macOS ISS#2323203)
 
 #pragma mark - Layout
 
@@ -205,8 +488,19 @@
 {
   // Note: `placeholder` defines intrinsic size for `<TextInput>`.
   NSString *text = self.placeholder ?: @"";
+  
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   CGSize size = [text sizeWithAttributes:[self placeholderEffectiveTextAttributes]];
   size = CGSizeMake(RCTCeilPixelValue(size.width), RCTCeilPixelValue(size.height));
+#else // [TODO(macOS ISS#2323203)
+  CGSize size = [text sizeWithAttributes:@{NSFontAttributeName: self.font}];
+  CGFloat scale = self.window.backingScaleFactor;
+  RCTAssert(scale != 0.0, @"Layout occurs before the view is in a window?");
+  if (scale == 0) {
+    scale = [[NSScreen mainScreen] backingScaleFactor];
+  }
+  size = CGSizeMake(RCTCeilPixelValue(size.width, scale), RCTCeilPixelValue(size.height, scale));
+#endif // ]TODO(macOS ISS#2323203)
   size.width += _textContainerInset.left + _textContainerInset.right;
   size.height += _textContainerInset.top + _textContainerInset.bottom;
   // Returning size DOES contain `textContainerInset` (aka `padding`).
@@ -220,4 +514,13 @@
   return CGSizeMake(MIN(size.width, intrinsicSize.width), MIN(size.height, intrinsicSize.height));
 }
 
+#if !TARGET_OS_OSX // [TODO(OSS Candidate ISS#2710739)
+- (void)deleteBackward {
+  id<RCTBackedTextInputDelegate> textInputDelegate = [self textInputDelegate];
+  if ([textInputDelegate textInputShouldHandleDeleteBackward:self]) {
+    [super deleteBackward];
+  }
+}
+#endif // ]TODO(OSS Candidate ISS#2710739)
+
 @end
