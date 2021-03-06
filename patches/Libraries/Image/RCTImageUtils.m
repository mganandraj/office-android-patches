--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageUtils.m"	2020-01-30 13:55:47.908608000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageUtils.m"	2020-01-29 14:10:08.902882300 -0800
@@ -10,7 +10,9 @@
 #import <tgmath.h>
 
 #import <ImageIO/ImageIO.h>
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 #import <MobileCoreServices/UTCoreTypes.h>
+#endif // TODO(macOS ISS#2323203)
 
 #import <React/RCTLog.h>
 #import <React/RCTUtils.h>
@@ -33,6 +35,7 @@
   };
 }
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 static CGImagePropertyOrientation CGImagePropertyOrientationFromUIImageOrientation(UIImageOrientation imageOrientation)
 {
   // see https://stackoverflow.com/a/6699649/496389
@@ -48,6 +51,7 @@
     default: return kCGImagePropertyOrientationUp;
   }
 }
+#endif // TODO(macOS ISS#2323203)
 
 CGRect RCTTargetRect(CGSize sourceSize, CGSize destSize,
                      CGFloat destScale, RCTResizeMode resizeMode)
@@ -280,7 +284,11 @@
       destScale = 1;
     }
   } else if (!destScale) {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     destScale = RCTScreenScale();
+#else // [TODO(macOS ISS#2323203)
+    destScale = 1.0; // It's not possible to derive the correct scale on macOS, but it's not necessary for NSImage anyway
+#endif // ]TODO(macOS ISS#2323203)
   }
 
   if (resizeMode == UIViewContentModeScaleToFill) {
@@ -310,9 +318,14 @@
   }
 
   // Return image
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   UIImage *image = [UIImage imageWithCGImage:imageRef
                                        scale:destScale
                                  orientation:UIImageOrientationUp];
+#else // [TODO(macOS ISS#2323203)
+	NSImage *image = [[NSImage alloc] initWithCGImage:imageRef
+                                               size:targetSize];
+#endif // ]TODO(macOS ISS#2323203)
   CGImageRelease(imageRef);
   return image;
 }
@@ -330,15 +343,22 @@
 
 NSData *__nullable RCTGetImageData(UIImage *image, float quality)
 {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   CGImageRef cgImage = image.CGImage;
+#else // [TODO(macOS ISS#2323203)
+  CGImageRef cgImage = [image CGImageForProposedRect:NULL context:NULL hints:NULL];
+#endif // ]TODO(macOS ISS#2323203)
   if (!cgImage) {
     return NULL;
   }
   NSMutableDictionary *properties = [[NSMutableDictionary alloc] initWithDictionary:@{
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     (id)kCGImagePropertyOrientation : @(CGImagePropertyOrientationFromUIImageOrientation(image.imageOrientation))
+#endif // TODO(macOS ISS#2323203)
   }];
   CGImageDestinationRef destination;
   CFMutableDataRef imageData = CFDataCreateMutable(NULL, 0);
+
   if (RCTImageHasAlpha(cgImage)) {
     // get png data
     destination = CGImageDestinationCreateWithData(imageData, kUTTypePNG, 1, NULL);
@@ -369,11 +389,15 @@
     return nil;
   }
 
-  BOOL opaque = !RCTImageHasAlpha(image.CGImage);
+  BOOL opaque = !RCTUIImageHasAlpha(image); // TODO(macOS ISS#2323203)
   UIGraphicsBeginImageContextWithOptions(destSize, opaque, destScale);
   CGContextRef currentContext = UIGraphicsGetCurrentContext();
   CGContextConcatCTM(currentContext, transform);
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   [image drawAtPoint:CGPointZero];
+#else // [TODO(macOS ISS#2323203)
+  [image drawAtPoint:CGPointZero fromRect:NSZeroRect operation:NSCompositingOperationSourceOver fraction:1.0];
+#endif // ]TODO(macOS ISS#2323203)
   UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
   UIGraphicsEndImageContext();
   return result;
@@ -390,3 +414,20 @@
       return YES;
   }
 }
+
+#if !TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+BOOL RCTUIImageHasAlpha(UIImage *image)
+{
+  return RCTImageHasAlpha(image.CGImage);
+}
+#else
+BOOL RCTUIImageHasAlpha(UIImage *image)
+{
+  for (NSImageRep *imageRep in image.representations) {
+    if (imageRep.hasAlpha) {
+      return YES;
+    }
+  }
+  return NO;
+}
+#endif // ]TODO(macOS ISS#2323203)
