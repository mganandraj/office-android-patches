diff --git a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/RCTBaseTextInputView.m b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/RCTBaseTextInputView.m
index 7c087ab11..d9b0d7310 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/RCTBaseTextInputView.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/RCTBaseTextInputView.m
@@ -19,13 +19,12 @@
 #import "RCTInputAccessoryViewContent.h"
 #import "RCTTextAttributes.h"
 #import "RCTTextSelection.h"
-#import "../RCTTextUIKit.h" // TODO(macOS ISS#2323203)
 
 @implementation RCTBaseTextInputView {
   __weak RCTBridge *_bridge;
   __weak RCTEventDispatcher *_eventDispatcher;
   BOOL _hasInputAccesoryView;
-  // TODO(OSS Candidate ISS#2710739): remove _predictedText ivar
+  NSString *_Nullable _predictedText;
   NSInteger _nativeEventCount;
 }
 
@@ -45,7 +44,7 @@ RCT_NOT_IMPLEMENTED(- (instancetype)init)
 RCT_NOT_IMPLEMENTED(- (instancetype)initWithCoder:(NSCoder *)decoder)
 RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)
 
-- (RCTUIView<RCTBackedTextInputViewProtocol> *)backedTextInputView // TODO(macOS ISS#3536887)
+- (UIView<RCTBackedTextInputViewProtocol> *)backedTextInputView
 {
   RCTAssert(NO, @"-[RCTBaseTextInputView backedTextInputView] must be implemented in subclass.");
   return nil;
@@ -68,34 +67,24 @@ RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)
 
 - (void)enforceTextAttributesIfNeeded
 {
-  if (![self ignoresTextAttributes]) { // TODO(OSS Candidate ISS#2710739)
-    id<RCTBackedTextInputViewProtocol> backedTextInputView = self.backedTextInputView;
-    if (backedTextInputView.attributedText.string.length != 0) {
-      return;
-    }
-
-    backedTextInputView.reactTextAttributes = _textAttributes;
-  } // TODO(OSS Candidate ISS#2710739)
+  id<RCTBackedTextInputViewProtocol> backedTextInputView = self.backedTextInputView;
+  backedTextInputView.reactTextAttributes = _textAttributes;
 }
 
 - (void)setReactPaddingInsets:(UIEdgeInsets)reactPaddingInsets
 {
   _reactPaddingInsets = reactPaddingInsets;
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   // We apply `paddingInsets` as `backedTextInputView`'s `textContainerInset`.
   self.backedTextInputView.textContainerInset = reactPaddingInsets;
   [self setNeedsLayout];
-#endif // TODO(macOS ISS#2323203)
 }
 
 - (void)setReactBorderInsets:(UIEdgeInsets)reactBorderInsets
 {
   _reactBorderInsets = reactBorderInsets;
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   // We apply `borderInsets` as `backedTextInputView` layout offset.
   self.backedTextInputView.frame = UIEdgeInsetsInsetRect(self.bounds, reactBorderInsets);
   [self setNeedsLayout];
-#endif // TODO(macOS ISS#2323203)
 }
 
 - (NSAttributedString *)attributedText
@@ -121,14 +110,10 @@ RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)
   }];
 
   BOOL shouldFallbackToBareTextComparison =
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     [self.backedTextInputView.textInputMode.primaryLanguage isEqualToString:@"dictation"] ||
     self.backedTextInputView.markedTextRange ||
     self.backedTextInputView.isSecureTextEntry ||
     fontHasBeenUpdatedBySystem;
-#else // [TODO(macOS ISS#2323203)
-    NO;
-#endif // ]TODO(macOS ISS#2323203)
 
   if (shouldFallbackToBareTextComparison) {
     return ([newText.string isEqualToString:oldText.string]);
@@ -154,16 +139,11 @@ RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)
   textNeedsUpdate = ([self textOf:attributedTextCopy equals:backedTextInputViewTextCopy] == NO);
 
   if (eventLag == 0 && textNeedsUpdate) {
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     UITextRange *selection = self.backedTextInputView.selectedTextRange;
-#else // [TODO(macOS ISS#2323203)
-    NSRange selection = [self.backedTextInputView selectedTextRange];
-#endif // ]TODO(macOS ISS#2323203)
     NSInteger oldTextLength = self.backedTextInputView.attributedText.string.length;
 
     self.backedTextInputView.attributedText = attributedText;
 
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     if (selection.empty) {
       // Maintaining a cursor position relative to the end of the old text.
       NSInteger offsetStart =
@@ -177,16 +157,6 @@ RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)
       [self.backedTextInputView setSelectedTextRange:[self.backedTextInputView textRangeFromPosition:position toPosition:position]
                                       notifyDelegate:YES];
     }
-#else // [TODO(macOS ISS#2323203)
-    if (selection.length == 0) {
-      // Maintaining a cursor position relative to the end of the old text.
-      NSInteger start = selection.location;
-      NSInteger offsetFromEnd = oldTextLength - start;
-      NSInteger newOffset = self.backedTextInputView.attributedText.length - offsetFromEnd;
-      [self.backedTextInputView setSelectedTextRange:NSMakeRange(newOffset, 0)
-                                      notifyDelegate:YES];
-    }
-#endif // ]TODO(macOS ISS#2323203)
 
     [self updateLocalData];
   } else if (eventLag > RCTTextUpdateLagWarningThreshold) {
@@ -197,15 +167,9 @@ RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)
 - (RCTTextSelection *)selection
 {
   id<RCTBackedTextInputViewProtocol> backedTextInputView = self.backedTextInputView;
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   UITextRange *selectedTextRange = backedTextInputView.selectedTextRange;
   return [[RCTTextSelection new] initWithStart:[backedTextInputView offsetFromPosition:backedTextInputView.beginningOfDocument toPosition:selectedTextRange.start]
                                            end:[backedTextInputView offsetFromPosition:backedTextInputView.beginningOfDocument toPosition:selectedTextRange.end]];
-#else // [TODO(macOS ISS#2323203)
-  NSRange selectedTextRange = backedTextInputView.selectedTextRange;
-  return [[RCTTextSelection new] initWithStart:selectedTextRange.location
-                                           end:selectedTextRange.location + selectedTextRange.length];
-#endif // ]TODO(macOS ISS#2323203)
 }
 
 - (void)setSelection:(RCTTextSelection *)selection
@@ -216,21 +180,13 @@ RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)
 
   id<RCTBackedTextInputViewProtocol> backedTextInputView = self.backedTextInputView;
 
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   UITextRange *previousSelectedTextRange = backedTextInputView.selectedTextRange;
   UITextPosition *start = [backedTextInputView positionFromPosition:backedTextInputView.beginningOfDocument offset:selection.start];
   UITextPosition *end = [backedTextInputView positionFromPosition:backedTextInputView.beginningOfDocument offset:selection.end];
   UITextRange *selectedTextRange = [backedTextInputView textRangeFromPosition:start toPosition:end];
-#else // [TODO(macOS ISS#2323203)
-  NSRange previousSelectedTextRange = backedTextInputView.selectedTextRange;
-  NSInteger start = MIN(selection.start, selection.end);
-  NSInteger end = MAX(selection.start, selection.end);
-  NSInteger length = end - selection.start;
-  NSRange selectedTextRange = NSMakeRange(start, length);
-#endif // ]TODO(macOS ISS#2323203)
-  
+
   NSInteger eventLag = _nativeEventCount - _mostRecentEventCount;
-  if (eventLag == 0 && !RCTTextSelectionEqual(previousSelectedTextRange, selectedTextRange)) { // TODO(macOS ISS#2323203)
+  if (eventLag == 0 && ![previousSelectedTextRange isEqual:selectedTextRange]) {
     [backedTextInputView setSelectedTextRange:selectedTextRange notifyDelegate:NO];
   } else if (eventLag > RCTTextUpdateLagWarningThreshold) {
     RCTLogWarn(@"Native TextInput(%@) is %lld events ahead of JS - try to make your JS faster.", backedTextInputView.attributedText.string, (long long)eventLag);
@@ -304,7 +260,6 @@ RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)
   #endif
 }
 
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (UIKeyboardType)keyboardType
 {
   return self.backedTextInputView.keyboardType;
@@ -321,29 +276,23 @@ RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)
     }
   }
 }
-#endif // TODO(macOS ISS#2323203)
 
 - (BOOL)secureTextEntry {
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203) // On Mac, this can be achieved by using an NSSecureTextField instead of an NSTextField
   return self.backedTextInputView.secureTextEntry;
-#else // TODO(macOS ISS#2323203)
-  return NO; // TODO(macOS ISS#2323203)
-#endif // TODO(macOS ISS#2323203)
 }
 
 - (void)setSecureTextEntry:(BOOL)secureTextEntry {
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   UIView<RCTBackedTextInputViewProtocol> *textInputView = self.backedTextInputView;
-    
+
   if (textInputView.secureTextEntry != secureTextEntry) {
     textInputView.secureTextEntry = secureTextEntry;
-      
+
     // Fix #5859, see https://stackoverflow.com/questions/14220187/uitextfield-has-trailing-whitespace-after-securetextentry-toggle/22537788#22537788
     NSAttributedString *originalText = [textInputView.attributedText copy];
     self.backedTextInputView.attributedText = [NSAttributedString new];
     self.backedTextInputView.attributedText = originalText;
   }
-#endif // TODO(macOS ISS#2323203)
+
 }
 
 #pragma mark - RCTBackedTextInputDelegate
@@ -434,19 +383,14 @@ RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)
         NSMutableAttributedString *newAttributedText = [backedTextInputView.attributedText mutableCopy];
         [newAttributedText replaceCharactersInRange:range withString:limitedString];
         backedTextInputView.attributedText = newAttributedText;
-        [self setPredictedText:newAttributedText.string]; // TODO(OSS Candidate ISS#2710739)
+        _predictedText = newAttributedText.string;
 
         // Collapse selection at end of insert to match normal paste behavior.
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
         UITextPosition *insertEnd = [backedTextInputView positionFromPosition:backedTextInputView.beginningOfDocument
                                                                        offset:(range.location + allowedLength)];
         [backedTextInputView setSelectedTextRange:[backedTextInputView textRangeFromPosition:insertEnd toPosition:insertEnd]
                                    notifyDelegate:YES];
-#else // [TODO(macOS ISS#2323203)
-        [backedTextInputView setSelectedTextRange:NSMakeRange(range.location + allowedLength, 0)
-                                   notifyDelegate:YES];
-#endif // ]TODO(macOS ISS#2323203)
-        
+
         [self textInputDidChange];
       }
 
@@ -489,12 +433,11 @@ RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)
   // update the mismatched range.
   NSRange currentRange;
   NSRange predictionRange;
-  if (findMismatch(backedTextInputView.attributedText.string, [self predictedText], &currentRange, &predictionRange)) { // TODO(OSS Candidate ISS#2710739)
+  if (findMismatch(backedTextInputView.attributedText.string, _predictedText, &currentRange, &predictionRange)) {
     NSString *replacement = [backedTextInputView.attributedText.string substringWithRange:currentRange];
     [self textInputShouldChangeTextInRange:predictionRange replacementText:replacement];
     // JS will assume the selection changed based on the location of our shouldChangeTextInRange, so reset it.
     [self textInputDidChangeSelection];
-    [self setPredictedText:backedTextInputView.attributedText.string]; // TODO(OSS Candidate ISS#2710739)
   }
 
   _nativeEventCount++;
@@ -524,18 +467,6 @@ RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)
   });
 }
 
-// [TODO(OSS Candidate ISS#2710739)
-- (BOOL)textInputShouldHandleDeleteBackward:(__unused id)sender {
-  return YES;
-}
-// ]TODO(OSS Candidate ISS#2710739)
-
-#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
-- (BOOL)textInputShouldHandleDeleteForward:(__unused id)sender {
-  return YES;
-}
-#endif // ]TODO(macOS ISS#2323203)
-
 - (void)updateLocalData
 {
   [self enforceTextAttributesIfNeeded];
@@ -576,7 +507,7 @@ RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)
 
 #pragma mark - Accessibility
 
-- (RCTUIView *)reactAccessibilityElement // TODO(macOS ISS#3536887)
+- (UIView *)reactAccessibilityElement
 {
   return self.backedTextInputView;
 }
@@ -611,7 +542,7 @@ RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)
 
 - (void)setCustomInputAccessoryViewWithNativeID:(NSString *)nativeID
 {
-  #if !TARGET_OS_TV && !TARGET_OS_OSX // TODO(macOS ISS#2323203)
+  #if !TARGET_OS_TV
   __weak RCTBaseTextInputView *weakSelf = self;
   [_bridge.uiManager rootViewForReactTag:self.reactTag withCompletion:^(UIView *rootView) {
     RCTBaseTextInputView *strongSelf = weakSelf;
@@ -624,12 +555,12 @@ RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)
       }
     }
   }];
-  #endif /* !TARGET_OS_TV && !TARGET_OS_OSX TODO(macOS ISS#2323203) */
+  #endif /* !TARGET_OS_TV */
 }
 
 - (void)setDefaultInputAccessoryView
 {
-  #if !TARGET_OS_TV && !TARGET_OS_OSX // TODO(macOS ISS#2323203)
+  #if !TARGET_OS_TV
   UIView<RCTBackedTextInputViewProtocol> *textInputView = self.backedTextInputView;
   UIKeyboardType keyboardType = textInputView.keyboardType;
 
@@ -668,10 +599,9 @@ RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)
     textInputView.inputAccessoryView = nil;
   }
   [self reloadInputViewsIfNecessary];
-  #endif /* !TARGET_OS_TV && !TARGET_OS_OSX TODO(macOS ISS#2323203) */
+  #endif /* !TARGET_OS_TV */
 }
 
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (void)reloadInputViewsIfNecessary
 {
   // We have to call `reloadInputViews` for focused text inputs to update an accessory view.
@@ -686,7 +616,6 @@ RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)
     [self.backedTextInputView endEditing:YES];
   }
 }
-#endif // TODO(macOS ISS#2323203)
 
 #pragma mark - Helpers
 
@@ -719,15 +648,4 @@ static BOOL findMismatch(NSString *first, NSString *second, NSRange *firstRange,
   return YES;
 }
 
-#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
-
-#pragma mark - NSResponder chain
-
-- (BOOL)canBecomeKeyView
-{
-  return NO; // Enclosed backedTextInputView can become the key view
-}
-
-#endif // ]TODO(macOS ISS#2323203)
-
 @end
