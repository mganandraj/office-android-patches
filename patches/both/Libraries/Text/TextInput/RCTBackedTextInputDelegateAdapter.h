diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\RCTBackedTextInputDelegateAdapter.h" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\RCTBackedTextInputDelegateAdapter.h"
index 5f5ea9c..8c3555b 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\RCTBackedTextInputDelegateAdapter.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\RCTBackedTextInputDelegateAdapter.h"
@@ -5,20 +5,24 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
-
-#import "RCTBackedTextInputViewProtocol.h"
-#import "RCTBackedTextInputDelegate.h"
+#import "../RCTTextUIKit.h" // TODO(macOS ISS#2323203)
 
 NS_ASSUME_NONNULL_BEGIN
 
 #pragma mark - RCTBackedTextFieldDelegateAdapter (for UITextField)
 
+@protocol RCTBackedTextInputViewProtocol; // TODO(OSS Candidate ISS#2710739)
+@protocol RCTBackedTextInputDelegate; // TODO(OSS Candidate ISS#2710739)
+
 @interface RCTBackedTextFieldDelegateAdapter : NSObject
 
 - (instancetype)initWithTextField:(UITextField<RCTBackedTextInputViewProtocol> *)backedTextInputView;
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (void)skipNextTextInputDidChangeSelectionEventWithTextRange:(UITextRange *)textRange;
+#else // [TODO(macOS ISS#2323203)
+- (void)skipNextTextInputDidChangeSelectionEventWithTextRange:(NSRange)textRange;
+#endif // ]TODO(macOS ISS#2323203)
 - (void)selectedTextRangeWasSet;
 
 @end
@@ -29,7 +33,11 @@ NS_ASSUME_NONNULL_BEGIN
 
 - (instancetype)initWithTextView:(UITextView<RCTBackedTextInputViewProtocol> *)backedTextInputView;
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (void)skipNextTextInputDidChangeSelectionEventWithTextRange:(UITextRange *)textRange;
+#else // [TODO(macOS ISS#2323203)
+- (void)skipNextTextInputDidChangeSelectionEventWithTextRange:(NSRange)textRange;
+#endif // ]TODO(macOS ISS#2323203)
 
 @end
 
