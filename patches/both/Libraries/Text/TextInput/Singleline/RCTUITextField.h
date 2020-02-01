diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\Singleline\\RCTUITextField.h" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\Singleline\\RCTUITextField.h"
index 5e3c5b3..5002841 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\Singleline\\RCTUITextField.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\Singleline\\RCTUITextField.h"
@@ -5,7 +5,9 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
+
+#import "RCTTextUIKit.h" // TODO(macOS ISS#2323203)
 
 #import "RCTBackedTextInputViewProtocol.h"
 
@@ -22,10 +24,27 @@ NS_ASSUME_NONNULL_BEGIN
 
 @property (nonatomic, assign) BOOL caretHidden;
 @property (nonatomic, assign) BOOL contextMenuHidden;
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 @property (nonatomic, assign, readonly) BOOL textWasPasted;
-@property (nonatomic, strong, nullable) UIColor *placeholderColor;
+#else // [TODO(macOS ISS#2323203)
+@property (nonatomic, assign) BOOL textWasPasted;
+#endif // ]TODO(macOS ISS#2323203)
+@property (nonatomic, strong, nullable) RCTUIColor *placeholderColor; // TODO(OSS Candidate ISS#2710739)
 @property (nonatomic, assign) UIEdgeInsets textContainerInset;
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 @property (nonatomic, assign, getter=isEditable) BOOL editable;
+#else // [TODO(macOS ISS#2323203)
+@property (assign, getter=isEditable) BOOL editable;
+#endif
+#if TARGET_OS_OSX
+@property (nonatomic, assign) NSTextAlignment textAlignment;
+@property (nonatomic, copy, nullable) NSAttributedString *attributedText;
+@property (nonatomic, copy, nullable) NSString *text;
+@property (nonatomic, getter=isAutomaticTextReplacementEnabled) BOOL automaticTextReplacementEnabled;
+@property (nonatomic, getter=isAutomaticSpellingCorrectionEnabled) BOOL automaticSpellingCorrectionEnabled;
+@property (nonatomic, strong, nullable) RCTUIColor *selectionColor;
+@property (weak, nullable) id<RCTUITextFieldDelegate> delegate;
+#endif // ]TODO(macOS ISS#2323203)
 
 @end
 
