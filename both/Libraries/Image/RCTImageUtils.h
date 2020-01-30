diff --git a/E:/github/ms-react-native-forpatch/Libraries/Image/RCTImageUtils.h b/E:/github/fb-react-native-forpatch/Libraries/Image/RCTImageUtils.h
index 49091ac22..a4b8216c4 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Image/RCTImageUtils.h
+++ b/E:/github/fb-react-native-forpatch/Libraries/Image/RCTImageUtils.h
@@ -6,7 +6,7 @@
  *
  */
 
-#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
+#import <UIKit/UIKit.h>
 
 #import <React/RCTDefines.h>
 #import <React/RCTResizeMode.h>
@@ -91,9 +91,4 @@ RCT_EXTERN UIImage *__nullable RCTTransformImage(UIImage *image,
  */
 RCT_EXTERN BOOL RCTImageHasAlpha(CGImageRef image);
 
-/*
- * Return YES if image has an alpha component
- */
-RCT_EXTERN BOOL RCTUIImageHasAlpha(UIImage *image); // TODO(macOS ISS#2323203)
-
 NS_ASSUME_NONNULL_END
