diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\RCTBackedTextInputDelegate.h" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\RCTBackedTextInputDelegate.h"
index f711fe6..c27bb8e 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\RCTBackedTextInputDelegate.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\RCTBackedTextInputDelegate.h"
@@ -5,7 +5,7 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 @protocol RCTBackedTextInputViewProtocol;
 
@@ -27,9 +27,13 @@ NS_ASSUME_NONNULL_BEGIN
 
 - (void)textInputDidChangeSelection;
 
-@optional
+- (BOOL)textInputShouldHandleDeleteBackward:(id<RCTBackedTextInputViewProtocol>)sender; // Return `YES` to have the deleteBackward event handled normally. Return `NO` to disallow it and handle it yourself. TODO(OSS Candidate ISS#2710739)
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+- (BOOL)textInputShouldHandleDeleteForward:(id<RCTBackedTextInputViewProtocol>)sender; // Return `YES` to have the deleteForward event handled normally. Return `NO` to disallow it and handle it yourself.
+#endif  // ]TODO(macOS ISS#2323203)
 
-- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
+@optional
+- (void)scrollViewDidScroll:(RCTUIScrollView *)scrollView;
 
 @end
 
