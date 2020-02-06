--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\RCTBackedTextInputDelegateAdapter.h"	2020-01-30 13:55:47.994608100 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\RCTBackedTextInputDelegateAdapter.h"	2020-01-29 14:10:08.997884100 -0800
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
@@ -29,7 +33,11 @@
 
 - (instancetype)initWithTextView:(UITextView<RCTBackedTextInputViewProtocol> *)backedTextInputView;
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (void)skipNextTextInputDidChangeSelectionEventWithTextRange:(UITextRange *)textRange;
+#else // [TODO(macOS ISS#2323203)
+- (void)skipNextTextInputDidChangeSelectionEventWithTextRange:(NSRange)textRange;
+#endif // ]TODO(macOS ISS#2323203)
 
 @end
 
