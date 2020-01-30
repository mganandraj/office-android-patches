diff --git a/E:/github/ms-react-native-forpatch/RNTester/RCTTest/FBSnapshotTestCase/UIImage+Compare.m b/E:/github/fb-react-native-forpatch/RNTester/RCTTest/FBSnapshotTestCase/UIImage+Compare.m
index 650001013..57b9f907f 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/RCTTest/FBSnapshotTestCase/UIImage+Compare.m
+++ b/E:/github/fb-react-native-forpatch/RNTester/RCTTest/FBSnapshotTestCase/UIImage+Compare.m
@@ -13,11 +13,9 @@
 {
   NSAssert(CGSizeEqualToSize(self.size, image.size), @"Images must be same size.");
 
-  CGImageRef imageRef = UIImageGetCGImageRef(image); // TODO(macOS ISS#2323203)
-  
   // The images have the equal size, so we could use the smallest amount of bytes because of byte padding
-  size_t minBytesPerRow = MIN(CGImageGetBytesPerRow(imageRef), CGImageGetBytesPerRow(imageRef)); // TODO(macOS ISS#2323203)
-  size_t referenceImageSizeBytes = CGImageGetHeight(imageRef) * minBytesPerRow; // TODO(macOS ISS#2323203)
+  size_t minBytesPerRow = MIN(CGImageGetBytesPerRow(self.CGImage), CGImageGetBytesPerRow(image.CGImage));
+  size_t referenceImageSizeBytes = CGImageGetHeight(self.CGImage) * minBytesPerRow;
   void *referenceImagePixels = calloc(1, referenceImageSizeBytes);
   void *imagePixels = calloc(1, referenceImageSizeBytes);
 
@@ -28,31 +26,23 @@
   }
 
   CGContextRef referenceImageContext = CGBitmapContextCreate(referenceImagePixels,
-                                                             CGImageGetWidth(imageRef), // TODO(macOS ISS#2323203)
-                                                             CGImageGetHeight(imageRef), // TODO(macOS ISS#2323203)
-                                                             CGImageGetBitsPerComponent(imageRef), // TODO(macOS ISS#2323203)
+                                                             CGImageGetWidth(self.CGImage),
+                                                             CGImageGetHeight(self.CGImage),
+                                                             CGImageGetBitsPerComponent(self.CGImage),
                                                              minBytesPerRow,
-                                                             CGImageGetColorSpace(imageRef), // TODO(macOS ISS#2323203)
+                                                             CGImageGetColorSpace(self.CGImage),
                                                              (CGBitmapInfo)kCGImageAlphaPremultipliedLast
                                                              );
   CGContextRef imageContext = CGBitmapContextCreate(imagePixels,
-                                                    CGImageGetWidth(imageRef), // TODO(macOS ISS#2323203)
-                                                    CGImageGetHeight(imageRef), // TODO(macOS ISS#2323203)
-                                                    CGImageGetBitsPerComponent(imageRef), // TODO(macOS ISS#2323203)
+                                                    CGImageGetWidth(image.CGImage),
+                                                    CGImageGetHeight(image.CGImage),
+                                                    CGImageGetBitsPerComponent(image.CGImage),
                                                     minBytesPerRow,
-                                                    CGImageGetColorSpace(imageRef), // TODO(macOS ISS#2323203)
+                                                    CGImageGetColorSpace(image.CGImage),
                                                     (CGBitmapInfo)kCGImageAlphaPremultipliedLast
                                                     );
 
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   CGFloat scaleFactor = [UIScreen mainScreen].scale;
-#else // [TODO(macOS ISS#2323203)
-  // The compareWithImage: method is used for integration test snapshot image comparison.
-  // The _snapshotView: method that creates snapshot images that are *not* scaled for the screen.
-  // By not using the screen scale factor in this method the test results are machine independent.
-  CGFloat scaleFactor = 1;
-#endif // ]TODO(macOS ISS#2323203)
-
   CGContextScaleCTM(referenceImageContext, scaleFactor, scaleFactor);
   CGContextScaleCTM(imageContext, scaleFactor, scaleFactor);
 
@@ -64,8 +54,8 @@
     return NO;
   }
 
-  CGContextDrawImage(referenceImageContext, CGRectMake(0.0f, 0.0f, self.size.width, self.size.height), imageRef); // TODO(macOS ISS#2323203)
-  CGContextDrawImage(imageContext, CGRectMake(0.0f, 0.0f, image.size.width, image.size.height), imageRef); // TODO(macOS ISS#2323203)
+  CGContextDrawImage(referenceImageContext, CGRectMake(0.0f, 0.0f, self.size.width, self.size.height), self.CGImage);
+  CGContextDrawImage(imageContext, CGRectMake(0.0f, 0.0f, image.size.width, image.size.height), image.CGImage);
   CGContextRelease(referenceImageContext);
   CGContextRelease(imageContext);
 
