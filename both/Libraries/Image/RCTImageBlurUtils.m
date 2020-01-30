diff --git a/E:/github/ms-react-native-forpatch/Libraries/Image/RCTImageBlurUtils.m b/E:/github/fb-react-native-forpatch/Libraries/Image/RCTImageBlurUtils.m
index 6f3a5e636..8ee3282de 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Image/RCTImageBlurUtils.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/Image/RCTImageBlurUtils.m
@@ -7,16 +7,11 @@
 
 #import "RCTImageBlurUtils.h"
 
-#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
-#import <React/RCTUtils.h> // TODO(macOS ISS#2323203)
-
 UIImage *RCTBlurredImageWithRadius(UIImage *inputImage, CGFloat radius)
 {
-  CGImageRef imageRef = UIImageGetCGImageRef(inputImage); // [TODO(macOS ISS#2323203)
-  CGFloat imageScale = UIImageGetScale(inputImage);
-#if !TARGET_OS_OSX // ]TODO(macOS ISS#2323203)
+  CGImageRef imageRef = inputImage.CGImage;
+  CGFloat imageScale = inputImage.scale;
   UIImageOrientation imageOrientation = inputImage.imageOrientation;
-#endif // TODO(macOS ISS#2323203)
 
   // Image must be nonzero size
   if (CGImageGetWidth(imageRef) * CGImageGetHeight(imageRef) == 0) {
@@ -27,14 +22,9 @@ UIImage *RCTBlurredImageWithRadius(UIImage *inputImage, CGFloat radius)
   if (CGImageGetBitsPerPixel(imageRef) != 32 ||
       CGImageGetBitsPerComponent(imageRef) != 8 ||
       !((CGImageGetBitmapInfo(imageRef) & kCGBitmapAlphaInfoMask))) {
-    UIGraphicsBeginImageContextWithOptions(inputImage.size, NO, imageScale);
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
-		[inputImage drawAtPoint:CGPointZero];
+    UIGraphicsBeginImageContextWithOptions(inputImage.size, NO, inputImage.scale);
+    [inputImage drawAtPoint:CGPointZero];
     imageRef = UIGraphicsGetImageFromCurrentImageContext().CGImage;
-#else // [TODO(macOS ISS#2323203)
-    [inputImage drawAtPoint:CGPointZero fromRect:NSZeroRect operation:NSCompositingOperationSourceOver fraction:1.0];
-    imageRef = (CGImageRef)CFAutorelease(CGBitmapContextCreateImage(UIGraphicsGetCurrentContext()));
-#endif // ]TODO(macOS ISS#2323203)
     UIGraphicsEndImageContext();
   }
 
@@ -89,11 +79,7 @@ UIImage *RCTBlurredImageWithRadius(UIImage *inputImage, CGFloat radius)
 
   //create image from context
   imageRef = CGBitmapContextCreateImage(ctx);
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   UIImage *outputImage = [UIImage imageWithCGImage:imageRef scale:imageScale orientation:imageOrientation];
-#else // [TODO(macOS ISS#2323203)
-  NSImage *outputImage = [[NSImage alloc] initWithCGImage:imageRef size:inputImage.size];
-#endif // ]TODO(macOS ISS#2323203)
   CGImageRelease(imageRef);
   CGContextRelease(ctx);
   free(buffer1.data);
