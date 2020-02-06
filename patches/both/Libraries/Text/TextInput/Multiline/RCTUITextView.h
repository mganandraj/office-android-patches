--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\Multiline\\RCTUITextView.h"	2020-01-30 13:55:47.993608800 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\Multiline\\RCTUITextView.h"	2020-01-29 14:10:08.997884100 -0800
@@ -5,7 +5,9 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
+
+#import "RCTTextUIKit.h" // TODO(macOS ISS#2323203)
 
 #import "RCTBackedTextInputViewProtocol.h"
 
@@ -24,20 +26,36 @@
 @property (nonatomic, weak) id<RCTBackedTextInputDelegate> textInputDelegate;
 
 @property (nonatomic, assign) BOOL contextMenuHidden;
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 @property (nonatomic, assign, readonly) BOOL textWasPasted;
+#else // [TODO(macOS ISS#2323203)
+@property (nonatomic, assign) BOOL textWasPasted;
+#endif // ]TODO(macOS ISS#2323203)
 @property (nonatomic, copy, nullable) NSString *placeholder;
-@property (nonatomic, strong, nullable) UIColor *placeholderColor;
+@property (nonatomic, strong, nullable) RCTUIColor *placeholderColor; // TODO(OSS Candidate ISS#2710739)
 
 @property (nonatomic, assign) CGFloat preferredMaxLayoutWidth;
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 // The `clearButtonMode` property actually is not supported yet;
 // it's declared here only to conform to the interface.
 @property (nonatomic, assign) UITextFieldViewMode clearButtonMode;
+#endif // TODO(macOS ISS#2323203)
 
 // The `caretHidden` property actually is not supported yet;
 // it's declared here only to conform to the interface.
 @property (nonatomic, assign) BOOL caretHidden;
 
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+@property (nonatomic, assign) BOOL scrollEnabled;
+@property (nonatomic, strong, nullable) RCTUIColor *selectionColor; // TODO(OSS Candidate ISS#2710739)
+@property (nonatomic, assign) UIEdgeInsets textContainerInsets;
+@property (nonatomic, copy) NSString *text;
+@property (nonatomic, assign) NSTextAlignment textAlignment;
+@property (nonatomic, copy, nullable) NSAttributedString *attributedText;
+- (NSSize)sizeThatFits:(NSSize)size;
+#endif // ]TODO(macOS ISS#2323203)
+
 @end
 
 NS_ASSUME_NONNULL_END
