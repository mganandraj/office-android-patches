diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\RCTBaseTextInputView.h" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\RCTBaseTextInputView.h"
index 5b62f90..a728b7c 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\RCTBaseTextInputView.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\RCTBaseTextInputView.h"
@@ -5,7 +5,7 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 #import <React/RCTView.h>
 
@@ -27,8 +27,12 @@ NS_ASSUME_NONNULL_BEGIN
 - (instancetype)initWithCoder:(NSCoder *)decoder NS_UNAVAILABLE;
 - (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
 
-@property (nonatomic, readonly) UIView<RCTBackedTextInputViewProtocol> *backedTextInputView;
+@property (nonatomic, readonly) RCTUIView<RCTBackedTextInputViewProtocol> *backedTextInputView; // TODO(macOS ISS#3536887)
 
+/**
+ Whether this text input ignores the `textAttributes` property. Defaults to `NO`. If set to `YES`, the value of `textAttributes` will be ignored in favor of standard text input behavior.
+ */
+@property (nonatomic) BOOL ignoresTextAttributes; // [TODO(OSS Candidate ISS#2710739)
 @property (nonatomic, strong, nullable) RCTTextAttributes *textAttributes;
 @property (nonatomic, assign) UIEdgeInsets reactPaddingInsets;
 @property (nonatomic, assign) UIEdgeInsets reactBorderInsets;
@@ -47,8 +51,11 @@ NS_ASSUME_NONNULL_BEGIN
 @property (nonatomic, copy) RCTTextSelection *selection;
 @property (nonatomic, strong, nullable) NSNumber *maxLength;
 @property (nonatomic, copy) NSAttributedString *attributedText;
+@property (nonatomic, copy) NSString *predictedText; // TODO(OSS Candidate ISS#2710739)
 @property (nonatomic, copy) NSString *inputAccessoryViewID;
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 @property (nonatomic, assign) UIKeyboardType keyboardType;
+#endif // TODO(macOS ISS#2323203)
 
 @end
 
