--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageUtils.h"	2020-01-30 13:55:47.908608000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageUtils.h"	2020-01-29 14:10:08.901883400 -0800
@@ -6,7 +6,7 @@
  *
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 #import <React/RCTDefines.h>
 #import <React/RCTResizeMode.h>
@@ -91,4 +91,9 @@
  */
 RCT_EXTERN BOOL RCTImageHasAlpha(CGImageRef image);
 
+/*
+ * Return YES if image has an alpha component
+ */
+RCT_EXTERN BOOL RCTUIImageHasAlpha(UIImage *image); // TODO(macOS ISS#2323203)
+
 NS_ASSUME_NONNULL_END
