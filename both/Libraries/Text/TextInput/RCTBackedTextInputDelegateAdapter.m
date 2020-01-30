diff --git a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/RCTBackedTextInputDelegateAdapter.m b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/RCTBackedTextInputDelegateAdapter.m
index 59a800b66..fe5ee6764 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/RCTBackedTextInputDelegateAdapter.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/RCTBackedTextInputDelegateAdapter.m
@@ -6,31 +6,18 @@
  */
 
 #import "RCTBackedTextInputDelegateAdapter.h"
-#import "RCTBackedTextInputViewProtocol.h" // TODO(OSS Candidate ISS#2710739)
-#import "RCTBackedTextInputDelegate.h" // TODO(OSS Candidate ISS#2710739)
-#import "../RCTTextUIKit.h" // TODO(macOS ISS#2323203)
 
 #pragma mark - RCTBackedTextFieldDelegateAdapter (for UITextField)
 
 static void *TextFieldSelectionObservingContext = &TextFieldSelectionObservingContext;
 
-@interface RCTBackedTextFieldDelegateAdapter ()
-#if !TARGET_OS_OSX // [TODO(macOS ISS#2323203)
-<UITextFieldDelegate>
-#else
-<RCTUITextFieldDelegate>
-#endif // ]TODO(macOS ISS#2323203)
-
+@interface RCTBackedTextFieldDelegateAdapter () <UITextFieldDelegate>
 @end
 
 @implementation RCTBackedTextFieldDelegateAdapter {
   __weak UITextField<RCTBackedTextInputViewProtocol> *_backedTextInputView;
   BOOL _textDidChangeIsComing;
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   UITextRange *_previousSelectedTextRange;
-#else // [TODO(macOS ISS#2323203)
-  NSRange _previousSelectedTextRange;
-#endif // ]TODO(macOS ISS#2323203)
 }
 
 - (instancetype)initWithTextField:(UITextField<RCTBackedTextInputViewProtocol> *)backedTextInputView
@@ -39,10 +26,8 @@ static void *TextFieldSelectionObservingContext = &TextFieldSelectionObservingCo
     _backedTextInputView = backedTextInputView;
     backedTextInputView.delegate = self;
 
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     [_backedTextInputView addTarget:self action:@selector(textFieldDidChange) forControlEvents:UIControlEventEditingChanged];
     [_backedTextInputView addTarget:self action:@selector(textFieldDidEndEditingOnExit) forControlEvents:UIControlEventEditingDidEndOnExit];
-#endif // TODO(macOS ISS#2323203)
   }
 
   return self;
@@ -50,10 +35,8 @@ static void *TextFieldSelectionObservingContext = &TextFieldSelectionObservingCo
 
 - (void)dealloc
 {
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   [_backedTextInputView removeTarget:self action:nil forControlEvents:UIControlEventEditingChanged];
   [_backedTextInputView removeTarget:self action:nil forControlEvents:UIControlEventEditingDidEndOnExit];
-#endif // TODO(macOS ISS#2323203)
 }
 
 #pragma mark - UITextFieldDelegate
@@ -127,11 +110,7 @@ static void *TextFieldSelectionObservingContext = &TextFieldSelectionObservingCo
 
 #pragma mark - Public Interface
 
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (void)skipNextTextInputDidChangeSelectionEventWithTextRange:(UITextRange *)textRange
-#else // [TODO(macOS ISS#2323203)
-- (void)skipNextTextInputDidChangeSelectionEventWithTextRange:(NSRange)textRange
-#endif // ]TODO(macOS ISS#2323203)
 {
   _previousSelectedTextRange = textRange;
 }
@@ -145,74 +124,14 @@ static void *TextFieldSelectionObservingContext = &TextFieldSelectionObservingCo
 
 - (void)textFieldProbablyDidChangeSelection
 {
-  if (RCTTextSelectionEqual([_backedTextInputView selectedTextRange], _previousSelectedTextRange)) { // TODO(macOS ISS#2323203)
+  if ([_backedTextInputView.selectedTextRange isEqual:_previousSelectedTextRange]) {
     return;
   }
 
-  _previousSelectedTextRange = [_backedTextInputView selectedTextRange]; // TODO(OSS Candidate ISS#2710739) setter not defined for mac
+  _previousSelectedTextRange = _backedTextInputView.selectedTextRange;
   [_backedTextInputView.textInputDelegate textInputDidChangeSelection];
 }
 
-#if TARGET_OS_OSX // TODO(macOS ISS#2323203)
-
-#pragma mark - NSTextFieldDelegate
-
-- (BOOL)control:(NSControl *)control textShouldEndEditing:(NSText *)fieldEditor
-{
-  return [self textFieldShouldEndEditing:_backedTextInputView];
-}
-
-- (BOOL)control:(NSControl *)control textView:(NSTextView *)fieldEditor doCommandBySelector:(SEL)commandSelector
-{
-  BOOL commandHandled = NO;
-  // enter/return
-  if (commandSelector == @selector(insertNewline:) || commandSelector == @selector(insertNewlineIgnoringFieldEditor:)) {
-    [self textFieldDidEndEditingOnExit];
-    commandHandled = YES;
-    //backspace
-  } else if (commandSelector == @selector(deleteBackward:)) {
-    id<RCTBackedTextInputDelegate> textInputDelegate = [_backedTextInputView textInputDelegate];
-    if (textInputDelegate != nil && ![textInputDelegate textInputShouldHandleDeleteBackward:_backedTextInputView]) {
-      commandHandled = YES;
-    } else {
-      [self keyboardInputShouldDelete:_backedTextInputView];
-    }
-    //deleteForward
-  } else if (commandSelector == @selector(deleteForward:)) {
-    id<RCTBackedTextInputDelegate> textInputDelegate = [_backedTextInputView textInputDelegate];
-    if (textInputDelegate != nil && ![textInputDelegate textInputShouldHandleDeleteForward:_backedTextInputView]) {
-      commandHandled = YES;
-    } else {
-      [self keyboardInputShouldDelete:_backedTextInputView];
-    }
-    //paste
-  } else if (commandSelector == @selector(paste:)) {
-    _backedTextInputView.textWasPasted = YES;
-  }
-  return commandHandled;
-}
-
-- (void)textFieldBeginEditing:(NSTextField *)textField
-{
-  [self textFieldDidBeginEditing:_backedTextInputView];
-}
-
-- (void)textFieldDidChange:(NSTextField *)textField
-{
-  [self textFieldDidChange];
-}
-
-- (void)textFieldEndEditing:(NSTextField *)textField
-{
-  [self textFieldDidEndEditing:_backedTextInputView];
-}
-
-- (void)textFieldDidChangeSelection:(NSTextField *)textField
-{
-  [self selectedTextRangeWasSet];
-}
-#endif // ]TODO(macOS ISS#2323203)
-
 @end
 
 #pragma mark - RCTBackedTextViewDelegateAdapter (for UITextView)
@@ -221,17 +140,9 @@ static void *TextFieldSelectionObservingContext = &TextFieldSelectionObservingCo
 @end
 
 @implementation RCTBackedTextViewDelegateAdapter {
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   __weak UITextView<RCTBackedTextInputViewProtocol> *_backedTextInputView;
-#else // TODO(macOS ISS#2323203)
-  __unsafe_unretained UITextView<RCTBackedTextInputViewProtocol> *_backedTextInputView;
-#endif // ]TODO(macOS ISS#2323203)
   BOOL _textDidChangeIsComing;
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   UITextRange *_previousSelectedTextRange;
-#else // [TODO(macOS ISS#2323203)
-  NSRange _previousSelectedTextRange;
-#endif // ]TODO(macOS ISS#2323203)
 }
 
 - (instancetype)initWithTextView:(UITextView<RCTBackedTextInputViewProtocol> *)backedTextInputView
@@ -279,11 +190,7 @@ static void *TextFieldSelectionObservingContext = &TextFieldSelectionObservingCo
   if (!_backedTextInputView.textWasPasted && [text isEqualToString:@"\n"]) {
     if ([_backedTextInputView.textInputDelegate textInputShouldReturn]) {
       [_backedTextInputView.textInputDelegate textInputDidReturn];
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
       [_backedTextInputView endEditing:NO];
-#else // [TODO(macOS ISS#2323203)
-      [[_backedTextInputView window] endEditingFor:nil];
-#endif // ]TODO(macOS ISS#2323203)
       return NO;
     }
   }
@@ -301,8 +208,6 @@ static void *TextFieldSelectionObservingContext = &TextFieldSelectionObservingCo
   [_backedTextInputView.textInputDelegate textInputDidChange];
 }
 
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
-
 - (void)textViewDidChangeSelection:(__unused UITextView *)textView
 {
   [self textViewProbablyDidChangeSelection];
@@ -317,65 +222,9 @@ static void *TextFieldSelectionObservingContext = &TextFieldSelectionObservingCo
   }
 }
 
-#endif // [TODO(macOS ISS#2323203)
-
-#if TARGET_OS_OSX
-
-#pragma mark - NSTextViewDelegate
-
-- (BOOL)textView:(NSTextView *)textView shouldChangeTextInRange:(NSRange)affectedCharRange replacementString:(nullable NSString *)replacementString
-{
-  return [self textView:textView shouldChangeTextInRange:affectedCharRange replacementText:replacementString];
-}
-
-- (void)textViewDidChangeSelection:(NSNotification *)notification
-{
-  [self textViewProbablyDidChangeSelection];
-}
-
-- (void)textDidBeginEditing:(NSNotification *)notification
-{
-  [self textViewDidBeginEditing:_backedTextInputView];
-}
-
-- (void)textDidChange:(NSNotification *)notification
-{
-  [self textViewDidChange:_backedTextInputView];
-}
-
-- (void)textDidEndEditing:(NSNotification *)notification
-{
-  [self textViewDidEndEditing:_backedTextInputView];
-}
-
-- (BOOL)textView:(NSTextView *)textView doCommandBySelector:(SEL)commandSelector
-{
-  BOOL commandHandled = NO;
-  id<RCTBackedTextInputDelegate> textInputDelegate = [_backedTextInputView textInputDelegate];
-  // enter/return
-  if (textInputDelegate.textInputShouldReturn && (commandSelector == @selector(insertNewline:) || commandSelector == @selector(insertNewlineIgnoringFieldEditor:))) {
-    [_backedTextInputView.window makeFirstResponder:nil];
-    commandHandled = YES;
-    //backspace
-  } else if (commandSelector == @selector(deleteBackward:)) {
-    commandHandled = textInputDelegate != nil && ![textInputDelegate textInputShouldHandleDeleteBackward:_backedTextInputView];
-    //deleteForward
-  } else if (commandSelector == @selector(deleteForward:)) {
-    commandHandled = textInputDelegate != nil && ![textInputDelegate textInputShouldHandleDeleteForward:_backedTextInputView];
-  }
-
-  return commandHandled;
-}
-
-#endif // ]TODO(macOS ISS#2323203)
-
 #pragma mark - Public Interface
 
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (void)skipNextTextInputDidChangeSelectionEventWithTextRange:(UITextRange *)textRange
-#else // [TODO(macOS ISS#2323203)
-- (void)skipNextTextInputDidChangeSelectionEventWithTextRange:(NSRange)textRange
-#endif // ]TODO(macOS ISS#2323203)
 {
   _previousSelectedTextRange = textRange;
 }
@@ -384,11 +233,11 @@ static void *TextFieldSelectionObservingContext = &TextFieldSelectionObservingCo
 
 - (void)textViewProbablyDidChangeSelection
 {
-  if (RCTTextSelectionEqual([_backedTextInputView selectedTextRange], _previousSelectedTextRange)) { // TODO(macOS ISS#2323203)
+  if ([_backedTextInputView.selectedTextRange isEqual:_previousSelectedTextRange]) {
     return;
   }
 
-  _previousSelectedTextRange = [_backedTextInputView selectedTextRange]; // TODO(OSS Candidate ISS#2710739) setter not defined for mac
+  _previousSelectedTextRange = _backedTextInputView.selectedTextRange;
   [_backedTextInputView.textInputDelegate textInputDidChangeSelection];
 }
 
