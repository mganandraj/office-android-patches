diff --git a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/RCTBaseTextInputView.h b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/RCTBaseTextInputView.h
index a728b7cd1..5b62f9025 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/RCTBaseTextInputView.h
+++ b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/RCTBaseTextInputView.h
@@ -5,7 +5,7 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
+#import <UIKit/UIKit.h>
 
 #import <React/RCTView.h>
 
@@ -27,12 +27,8 @@ NS_ASSUME_NONNULL_BEGIN
 - (instancetype)initWithCoder:(NSCoder *)decoder NS_UNAVAILABLE;
 - (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
 
-@property (nonatomic, readonly) RCTUIView<RCTBackedTextInputViewProtocol> *backedTextInputView; // TODO(macOS ISS#3536887)
+@property (nonatomic, readonly) UIView<RCTBackedTextInputViewProtocol> *backedTextInputView;
 
-/**
- Whether this text input ignores the `textAttributes` property. Defaults to `NO`. If set to `YES`, the value of `textAttributes` will be ignored in favor of standard text input behavior.
- */
-@property (nonatomic) BOOL ignoresTextAttributes; // [TODO(OSS Candidate ISS#2710739)
 @property (nonatomic, strong, nullable) RCTTextAttributes *textAttributes;
 @property (nonatomic, assign) UIEdgeInsets reactPaddingInsets;
 @property (nonatomic, assign) UIEdgeInsets reactBorderInsets;
@@ -51,11 +47,8 @@ NS_ASSUME_NONNULL_BEGIN
 @property (nonatomic, copy) RCTTextSelection *selection;
 @property (nonatomic, strong, nullable) NSNumber *maxLength;
 @property (nonatomic, copy) NSAttributedString *attributedText;
-@property (nonatomic, copy) NSString *predictedText; // TODO(OSS Candidate ISS#2710739)
 @property (nonatomic, copy) NSString *inputAccessoryViewID;
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 @property (nonatomic, assign) UIKeyboardType keyboardType;
-#endif // TODO(macOS ISS#2323203)
 
 @end
 
