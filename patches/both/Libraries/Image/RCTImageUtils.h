diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageUtils.h" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageUtils.h"
index a4b8216..49091ac 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageUtils.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageUtils.h"
@@ -6,7 +6,7 @@
  *
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 #import <React/RCTDefines.h>
 #import <React/RCTResizeMode.h>
@@ -91,4 +91,9 @@ RCT_EXTERN UIImage *__nullable RCTTransformImage(UIImage *image,
  */
 RCT_EXTERN BOOL RCTImageHasAlpha(CGImageRef image);
 
+/*
+ * Return YES if image has an alpha component
+ */
+RCT_EXTERN BOOL RCTUIImageHasAlpha(UIImage *image); // TODO(macOS ISS#2323203)
+
 NS_ASSUME_NONNULL_END
