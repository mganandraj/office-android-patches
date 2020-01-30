diff --git a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/RCTBackedTextInputDelegate.h b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/RCTBackedTextInputDelegate.h
index c27bb8e6d..f711fe683 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/RCTBackedTextInputDelegate.h
+++ b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/RCTBackedTextInputDelegate.h
@@ -5,7 +5,7 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
+#import <UIKit/UIKit.h>
 
 @protocol RCTBackedTextInputViewProtocol;
 
@@ -27,13 +27,9 @@ NS_ASSUME_NONNULL_BEGIN
 
 - (void)textInputDidChangeSelection;
 
-- (BOOL)textInputShouldHandleDeleteBackward:(id<RCTBackedTextInputViewProtocol>)sender; // Return `YES` to have the deleteBackward event handled normally. Return `NO` to disallow it and handle it yourself. TODO(OSS Candidate ISS#2710739)
-#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
-- (BOOL)textInputShouldHandleDeleteForward:(id<RCTBackedTextInputViewProtocol>)sender; // Return `YES` to have the deleteForward event handled normally. Return `NO` to disallow it and handle it yourself.
-#endif  // ]TODO(macOS ISS#2323203)
-
 @optional
-- (void)scrollViewDidScroll:(RCTUIScrollView *)scrollView;
+
+- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
 
 @end
 
