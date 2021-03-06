--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\RCTBackedTextInputViewProtocol.h"	2020-01-30 13:55:47.994608100 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\RCTBackedTextInputViewProtocol.h"	2020-01-29 14:10:08.998884600 -0800
@@ -5,24 +5,47 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // [TODO(macOS ISS#2323203)
+
+#if TARGET_OS_OSX
+NS_ASSUME_NONNULL_BEGIN
+@protocol RCTUITextFieldDelegate <NSTextFieldDelegate>
+@optional
+- (BOOL)textField:(NSTextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;   // return NO to not change text
+- (void)textFieldBeginEditing:(NSTextField *)textField;
+- (void)textFieldDidChange:(NSTextField *)textField;
+- (void)textFieldEndEditing:(NSTextField *)textField;
+- (void)textFieldDidChangeSelection:(NSTextField *)textField;
+@end
+NS_ASSUME_NONNULL_END
+#endif // ]TODO(macOS ISS#2323203)
 
 @protocol RCTBackedTextInputDelegate;
 @class RCTTextAttributes;
 
 NS_ASSUME_NONNULL_BEGIN
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 @protocol RCTBackedTextInputViewProtocol <UITextInput>
+#else // [TODO(macOS ISS#2323203)
+@protocol RCTBackedTextInputViewProtocol
+#endif // ]TODO(macOS ISS#2323203)
 
-@property (nonatomic, strong, nullable) UIColor *textColor;
+@property (nonatomic, strong, nullable) RCTUIColor *textColor; // TODO(OSS Candidate ISS#2710739)
 @property (nonatomic, strong, nullable) UIFont *font;
 @property (nonatomic, copy, nullable) NSAttributedString *attributedText;
 @property (nonatomic, copy, nullable) NSString *placeholder;
-@property (nonatomic, strong, nullable) UIColor *placeholderColor;
+@property (nonatomic, strong, nullable) RCTUIColor *placeholderColor; // TODO(OSS Candidate ISS#2710739)
 @property (nonatomic, assign) NSTextAlignment textAlignment;
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 @property (nonatomic, assign, readonly) BOOL textWasPasted;
+#else // [TODO(macOS ISS#2323203)
+@property (nonatomic, assign) BOOL textWasPasted;
+#endif // ]TODO(macOS ISS#2323203)
 @property (nonatomic, assign) UIEdgeInsets textContainerInset;
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 @property (nonatomic, strong, nullable) UIView *inputAccessoryView;
+#endif // TODO(macOS ISS#2323203)
 @property (nonatomic, weak, nullable) id<RCTBackedTextInputDelegate> textInputDelegate;
 @property (nonatomic, readonly) CGSize contentSize;
 @property (nonatomic, strong, nullable) RCTTextAttributes *reactTextAttributes;
@@ -32,8 +55,19 @@
 // explicitly specify should `delegate` be notified about the change or not.
 // If the change was initiated programmatically, we must NOT notify the delegate.
 // If the change was a result of user actions (like typing or touches), we MUST notify the delegate.
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (void)setSelectedTextRange:(nullable UITextRange *)selectedTextRange NS_UNAVAILABLE;
 - (void)setSelectedTextRange:(nullable UITextRange *)selectedTextRange notifyDelegate:(BOOL)notifyDelegate;
+#else // [TODO(macOS ISS#2323203)
+- (NSRange)selectedTextRange;
+- (void)setSelectedTextRange:(NSRange)selectedTextRange NS_UNAVAILABLE;
+- (void)setSelectedTextRange:(NSRange)selectedTextRange notifyDelegate:(BOOL)notifyDelegate;
+#endif // ]TODO(macOS ISS#2323203)
+
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+// UITextInput method for OSX
+- (CGSize)sizeThatFits:(CGSize)size;
+#endif // ]TODO(macOS ISS#2323203)
 
 // This protocol disallows direct access to `text` property because
 // unwise usage of it can break the `attributeText` behavior.
