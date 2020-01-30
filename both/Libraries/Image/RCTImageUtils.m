diff --git a/E:/github/ms-react-native-forpatch/Libraries/Image/RCTImageUtils.m b/E:/github/fb-react-native-forpatch/Libraries/Image/RCTImageUtils.m
index 8799a6f30..0d2e1df1e 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Image/RCTImageUtils.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/Image/RCTImageUtils.m
@@ -10,9 +10,7 @@
 #import <tgmath.h>
 
 #import <ImageIO/ImageIO.h>
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 #import <MobileCoreServices/UTCoreTypes.h>
-#endif // TODO(macOS ISS#2323203)
 
 #import <React/RCTLog.h>
 #import <React/RCTUtils.h>
@@ -35,7 +33,6 @@ static CGSize RCTCeilSize(CGSize size, CGFloat scale)
   };
 }
 
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 static CGImagePropertyOrientation CGImagePropertyOrientationFromUIImageOrientation(UIImageOrientation imageOrientation)
 {
   // see https://stackoverflow.com/a/6699649/496389
@@ -51,7 +48,6 @@ static CGImagePropertyOrientation CGImagePropertyOrientationFromUIImageOrientati
     default: return kCGImagePropertyOrientationUp;
   }
 }
-#endif // TODO(macOS ISS#2323203)
 
 CGRect RCTTargetRect(CGSize sourceSize, CGSize destSize,
                      CGFloat destScale, RCTResizeMode resizeMode)
@@ -284,11 +280,7 @@ UIImage *__nullable RCTDecodeImageWithData(NSData *data,
       destScale = 1;
     }
   } else if (!destScale) {
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     destScale = RCTScreenScale();
-#else // [TODO(macOS ISS#2323203)
-    destScale = 1.0; // It's not possible to derive the correct scale on macOS, but it's not necessary for NSImage anyway
-#endif // ]TODO(macOS ISS#2323203)
   }
 
   if (resizeMode == UIViewContentModeScaleToFill) {
@@ -318,14 +310,9 @@ UIImage *__nullable RCTDecodeImageWithData(NSData *data,
   }
 
   // Return image
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   UIImage *image = [UIImage imageWithCGImage:imageRef
                                        scale:destScale
                                  orientation:UIImageOrientationUp];
-#else // [TODO(macOS ISS#2323203)
-	NSImage *image = [[NSImage alloc] initWithCGImage:imageRef
-                                               size:targetSize];
-#endif // ]TODO(macOS ISS#2323203)
   CGImageRelease(imageRef);
   return image;
 }
@@ -343,22 +330,15 @@ NSDictionary<NSString *, id> *__nullable RCTGetImageMetadata(NSData *data)
 
 NSData *__nullable RCTGetImageData(UIImage *image, float quality)
 {
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   CGImageRef cgImage = image.CGImage;
-#else // [TODO(macOS ISS#2323203)
-  CGImageRef cgImage = [image CGImageForProposedRect:NULL context:NULL hints:NULL];
-#endif // ]TODO(macOS ISS#2323203)
   if (!cgImage) {
     return NULL;
   }
   NSMutableDictionary *properties = [[NSMutableDictionary alloc] initWithDictionary:@{
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     (id)kCGImagePropertyOrientation : @(CGImagePropertyOrientationFromUIImageOrientation(image.imageOrientation))
-#endif // TODO(macOS ISS#2323203)
   }];
   CGImageDestinationRef destination;
   CFMutableDataRef imageData = CFDataCreateMutable(NULL, 0);
-
   if (RCTImageHasAlpha(cgImage)) {
     // get png data
     destination = CGImageDestinationCreateWithData(imageData, kUTTypePNG, 1, NULL);
@@ -389,15 +369,11 @@ UIImage *__nullable RCTTransformImage(UIImage *image,
     return nil;
   }
 
-  BOOL opaque = !RCTUIImageHasAlpha(image); // TODO(macOS ISS#2323203)
+  BOOL opaque = !RCTImageHasAlpha(image.CGImage);
   UIGraphicsBeginImageContextWithOptions(destSize, opaque, destScale);
   CGContextRef currentContext = UIGraphicsGetCurrentContext();
   CGContextConcatCTM(currentContext, transform);
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   [image drawAtPoint:CGPointZero];
-#else // [TODO(macOS ISS#2323203)
-  [image drawAtPoint:CGPointZero fromRect:NSZeroRect operation:NSCompositingOperationSourceOver fraction:1.0];
-#endif // ]TODO(macOS ISS#2323203)
   UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
   UIGraphicsEndImageContext();
   return result;
@@ -414,20 +390,3 @@ BOOL RCTImageHasAlpha(CGImageRef image)
       return YES;
   }
 }
-
-#if !TARGET_OS_OSX // [TODO(macOS ISS#2323203)
-BOOL RCTUIImageHasAlpha(UIImage *image)
-{
-  return RCTImageHasAlpha(image.CGImage);
-}
-#else
-BOOL RCTUIImageHasAlpha(UIImage *image)
-{
-  for (NSImageRep *imageRep in image.representations) {
-    if (imageRep.hasAlpha) {
-      return YES;
-    }
-  }
-  return NO;
-}
-#endif // ]TODO(macOS ISS#2323203)
