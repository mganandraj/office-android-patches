--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\RCTBackedTextInputDelegateAdapter.m"	2020-01-30 13:55:47.994608100 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\RCTBackedTextInputDelegateAdapter.m"	2020-01-29 14:10:08.998884600 -0800
@@ -6,18 +6,31 @@
  */
 
 #import "RCTBackedTextInputDelegateAdapter.h"
+#import "RCTBackedTextInputViewProtocol.h" // TODO(OSS Candidate ISS#2710739)
+#import "RCTBackedTextInputDelegate.h" // TODO(OSS Candidate ISS#2710739)
+#import "../RCTTextUIKit.h" // TODO(macOS ISS#2323203)
 
 #pragma mark - RCTBackedTextFieldDelegateAdapter (for UITextField)
 
 static void *TextFieldSelectionObservingContext = &TextFieldSelectionObservingContext;
 
-@interface RCTBackedTextFieldDelegateAdapter () <UITextFieldDelegate>
+@interface RCTBackedTextFieldDelegateAdapter ()
+#if !TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+<UITextFieldDelegate>
+#else
+<RCTUITextFieldDelegate>
+#endif // ]TODO(macOS ISS#2323203)
+
 @end
 
 @implementation RCTBackedTextFieldDelegateAdapter {
   __weak UITextField<RCTBackedTextInputViewProtocol> *_backedTextInputView;
   BOOL _textDidChangeIsComing;
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   UITextRange *_previousSelectedTextRange;
+#else // [TODO(macOS ISS#2323203)
+  NSRange _previousSelectedTextRange;
+#endif // ]TODO(macOS ISS#2323203)
 }
 
 - (instancetype)initWithTextField:(UITextField<RCTBackedTextInputViewProtocol> *)backedTextInputView
@@ -26,8 +39,10 @@
     _backedTextInputView = backedTextInputView;
     backedTextInputView.delegate = self;
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     [_backedTextInputView addTarget:self action:@selector(textFieldDidChange) forControlEvents:UIControlEventEditingChanged];
     [_backedTextInputView addTarget:self action:@selector(textFieldDidEndEditingOnExit) forControlEvents:UIControlEventEditingDidEndOnExit];
+#endif // TODO(macOS ISS#2323203)
   }
 
   return self;
@@ -35,8 +50,10 @@
 
 - (void)dealloc
 {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   [_backedTextInputView removeTarget:self action:nil forControlEvents:UIControlEventEditingChanged];
   [_backedTextInputView removeTarget:self action:nil forControlEvents:UIControlEventEditingDidEndOnExit];
+#endif // TODO(macOS ISS#2323203)
 }
 
 #pragma mark - UITextFieldDelegate
@@ -110,7 +127,11 @@
 
 #pragma mark - Public Interface
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (void)skipNextTextInputDidChangeSelectionEventWithTextRange:(UITextRange *)textRange
+#else // [TODO(macOS ISS#2323203)
+- (void)skipNextTextInputDidChangeSelectionEventWithTextRange:(NSRange)textRange
+#endif // ]TODO(macOS ISS#2323203)
 {
   _previousSelectedTextRange = textRange;
 }
@@ -124,14 +145,74 @@
 
 - (void)textFieldProbablyDidChangeSelection
 {
-  if ([_backedTextInputView.selectedTextRange isEqual:_previousSelectedTextRange]) {
+  if (RCTTextSelectionEqual([_backedTextInputView selectedTextRange], _previousSelectedTextRange)) { // TODO(macOS ISS#2323203)
     return;
   }
 
-  _previousSelectedTextRange = _backedTextInputView.selectedTextRange;
+  _previousSelectedTextRange = [_backedTextInputView selectedTextRange]; // TODO(OSS Candidate ISS#2710739) setter not defined for mac
   [_backedTextInputView.textInputDelegate textInputDidChangeSelection];
 }
 
+#if TARGET_OS_OSX // TODO(macOS ISS#2323203)
+
+#pragma mark - NSTextFieldDelegate
+
+- (BOOL)control:(NSControl *)control textShouldEndEditing:(NSText *)fieldEditor
+{
+  return [self textFieldShouldEndEditing:_backedTextInputView];
+}
+
+- (BOOL)control:(NSControl *)control textView:(NSTextView *)fieldEditor doCommandBySelector:(SEL)commandSelector
+{
+  BOOL commandHandled = NO;
+  // enter/return
+  if (commandSelector == @selector(insertNewline:) || commandSelector == @selector(insertNewlineIgnoringFieldEditor:)) {
+    [self textFieldDidEndEditingOnExit];
+    commandHandled = YES;
+    //backspace
+  } else if (commandSelector == @selector(deleteBackward:)) {
+    id<RCTBackedTextInputDelegate> textInputDelegate = [_backedTextInputView textInputDelegate];
+    if (textInputDelegate != nil && ![textInputDelegate textInputShouldHandleDeleteBackward:_backedTextInputView]) {
+      commandHandled = YES;
+    } else {
+      [self keyboardInputShouldDelete:_backedTextInputView];
+    }
+    //deleteForward
+  } else if (commandSelector == @selector(deleteForward:)) {
+    id<RCTBackedTextInputDelegate> textInputDelegate = [_backedTextInputView textInputDelegate];
+    if (textInputDelegate != nil && ![textInputDelegate textInputShouldHandleDeleteForward:_backedTextInputView]) {
+      commandHandled = YES;
+    } else {
+      [self keyboardInputShouldDelete:_backedTextInputView];
+    }
+    //paste
+  } else if (commandSelector == @selector(paste:)) {
+    _backedTextInputView.textWasPasted = YES;
+  }
+  return commandHandled;
+}
+
+- (void)textFieldBeginEditing:(NSTextField *)textField
+{
+  [self textFieldDidBeginEditing:_backedTextInputView];
+}
+
+- (void)textFieldDidChange:(NSTextField *)textField
+{
+  [self textFieldDidChange];
+}
+
+- (void)textFieldEndEditing:(NSTextField *)textField
+{
+  [self textFieldDidEndEditing:_backedTextInputView];
+}
+
+- (void)textFieldDidChangeSelection:(NSTextField *)textField
+{
+  [self selectedTextRangeWasSet];
+}
+#endif // ]TODO(macOS ISS#2323203)
+
 @end
 
 #pragma mark - RCTBackedTextViewDelegateAdapter (for UITextView)
@@ -140,9 +221,17 @@
 @end
 
 @implementation RCTBackedTextViewDelegateAdapter {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   __weak UITextView<RCTBackedTextInputViewProtocol> *_backedTextInputView;
+#else // TODO(macOS ISS#2323203)
+  __unsafe_unretained UITextView<RCTBackedTextInputViewProtocol> *_backedTextInputView;
+#endif // ]TODO(macOS ISS#2323203)
   BOOL _textDidChangeIsComing;
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   UITextRange *_previousSelectedTextRange;
+#else // [TODO(macOS ISS#2323203)
+  NSRange _previousSelectedTextRange;
+#endif // ]TODO(macOS ISS#2323203)
 }
 
 - (instancetype)initWithTextView:(UITextView<RCTBackedTextInputViewProtocol> *)backedTextInputView
@@ -190,7 +279,11 @@
   if (!_backedTextInputView.textWasPasted && [text isEqualToString:@"\n"]) {
     if ([_backedTextInputView.textInputDelegate textInputShouldReturn]) {
       [_backedTextInputView.textInputDelegate textInputDidReturn];
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
       [_backedTextInputView endEditing:NO];
+#else // [TODO(macOS ISS#2323203)
+      [[_backedTextInputView window] endEditingFor:nil];
+#endif // ]TODO(macOS ISS#2323203)
       return NO;
     }
   }
@@ -208,6 +301,8 @@
   [_backedTextInputView.textInputDelegate textInputDidChange];
 }
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
+
 - (void)textViewDidChangeSelection:(__unused UITextView *)textView
 {
   [self textViewProbablyDidChangeSelection];
@@ -222,9 +317,65 @@
   }
 }
 
+#endif // [TODO(macOS ISS#2323203)
+
+#if TARGET_OS_OSX
+
+#pragma mark - NSTextViewDelegate
+
+- (BOOL)textView:(NSTextView *)textView shouldChangeTextInRange:(NSRange)affectedCharRange replacementString:(nullable NSString *)replacementString
+{
+  return [self textView:textView shouldChangeTextInRange:affectedCharRange replacementText:replacementString];
+}
+
+- (void)textViewDidChangeSelection:(NSNotification *)notification
+{
+  [self textViewProbablyDidChangeSelection];
+}
+
+- (void)textDidBeginEditing:(NSNotification *)notification
+{
+  [self textViewDidBeginEditing:_backedTextInputView];
+}
+
+- (void)textDidChange:(NSNotification *)notification
+{
+  [self textViewDidChange:_backedTextInputView];
+}
+
+- (void)textDidEndEditing:(NSNotification *)notification
+{
+  [self textViewDidEndEditing:_backedTextInputView];
+}
+
+- (BOOL)textView:(NSTextView *)textView doCommandBySelector:(SEL)commandSelector
+{
+  BOOL commandHandled = NO;
+  id<RCTBackedTextInputDelegate> textInputDelegate = [_backedTextInputView textInputDelegate];
+  // enter/return
+  if (textInputDelegate.textInputShouldReturn && (commandSelector == @selector(insertNewline:) || commandSelector == @selector(insertNewlineIgnoringFieldEditor:))) {
+    [_backedTextInputView.window makeFirstResponder:nil];
+    commandHandled = YES;
+    //backspace
+  } else if (commandSelector == @selector(deleteBackward:)) {
+    commandHandled = textInputDelegate != nil && ![textInputDelegate textInputShouldHandleDeleteBackward:_backedTextInputView];
+    //deleteForward
+  } else if (commandSelector == @selector(deleteForward:)) {
+    commandHandled = textInputDelegate != nil && ![textInputDelegate textInputShouldHandleDeleteForward:_backedTextInputView];
+  }
+
+  return commandHandled;
+}
+
+#endif // ]TODO(macOS ISS#2323203)
+
 #pragma mark - Public Interface
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (void)skipNextTextInputDidChangeSelectionEventWithTextRange:(UITextRange *)textRange
+#else // [TODO(macOS ISS#2323203)
+- (void)skipNextTextInputDidChangeSelectionEventWithTextRange:(NSRange)textRange
+#endif // ]TODO(macOS ISS#2323203)
 {
   _previousSelectedTextRange = textRange;
 }
@@ -233,11 +384,11 @@
 
 - (void)textViewProbablyDidChangeSelection
 {
-  if ([_backedTextInputView.selectedTextRange isEqual:_previousSelectedTextRange]) {
+  if (RCTTextSelectionEqual([_backedTextInputView selectedTextRange], _previousSelectedTextRange)) { // TODO(macOS ISS#2323203)
     return;
   }
 
-  _previousSelectedTextRange = _backedTextInputView.selectedTextRange;
+  _previousSelectedTextRange = [_backedTextInputView selectedTextRange]; // TODO(OSS Candidate ISS#2710739) setter not defined for mac
   [_backedTextInputView.textInputDelegate textInputDidChangeSelection];
 }
 
