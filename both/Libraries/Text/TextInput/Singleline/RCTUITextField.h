diff --git a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/Singleline/RCTUITextField.h b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/Singleline/RCTUITextField.h
index 50028411d..5e3c5b340 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/Singleline/RCTUITextField.h
+++ b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/Singleline/RCTUITextField.h
@@ -5,9 +5,7 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
-
-#import "RCTTextUIKit.h" // TODO(macOS ISS#2323203)
+#import <UIKit/UIKit.h>
 
 #import "RCTBackedTextInputViewProtocol.h"
 
@@ -24,27 +22,10 @@ NS_ASSUME_NONNULL_BEGIN
 
 @property (nonatomic, assign) BOOL caretHidden;
 @property (nonatomic, assign) BOOL contextMenuHidden;
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 @property (nonatomic, assign, readonly) BOOL textWasPasted;
-#else // [TODO(macOS ISS#2323203)
-@property (nonatomic, assign) BOOL textWasPasted;
-#endif // ]TODO(macOS ISS#2323203)
-@property (nonatomic, strong, nullable) RCTUIColor *placeholderColor; // TODO(OSS Candidate ISS#2710739)
+@property (nonatomic, strong, nullable) UIColor *placeholderColor;
 @property (nonatomic, assign) UIEdgeInsets textContainerInset;
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 @property (nonatomic, assign, getter=isEditable) BOOL editable;
-#else // [TODO(macOS ISS#2323203)
-@property (assign, getter=isEditable) BOOL editable;
-#endif
-#if TARGET_OS_OSX
-@property (nonatomic, assign) NSTextAlignment textAlignment;
-@property (nonatomic, copy, nullable) NSAttributedString *attributedText;
-@property (nonatomic, copy, nullable) NSString *text;
-@property (nonatomic, getter=isAutomaticTextReplacementEnabled) BOOL automaticTextReplacementEnabled;
-@property (nonatomic, getter=isAutomaticSpellingCorrectionEnabled) BOOL automaticSpellingCorrectionEnabled;
-@property (nonatomic, strong, nullable) RCTUIColor *selectionColor;
-@property (weak, nullable) id<RCTUITextFieldDelegate> delegate;
-#endif // ]TODO(macOS ISS#2323203)
 
 @end
 
