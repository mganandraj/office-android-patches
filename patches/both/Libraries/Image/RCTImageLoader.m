diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageLoader.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageLoader.m"
index 13a485f..ab718b2 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageLoader.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageLoader.m"
@@ -12,6 +12,7 @@
 
 #import <React/RCTConvert.h>
 #import <React/RCTDefines.h>
+#import <React/RCTDevSettings.h> // TODO(OSS Candidate ISS#2710739)
 #import <React/RCTImageLoader.h>
 #import <React/RCTLog.h>
 #import <React/RCTNetworking.h>
@@ -23,11 +24,19 @@
 static NSInteger RCTImageBytesForImage(UIImage *image)
 {
   CAKeyframeAnimation *keyFrameAnimation = [image reactKeyframeAnimation];
-  NSInteger singleImageBytes = image.size.width * image.size.height * image.scale * image.scale * 4;
+  CGFloat imageScale = 1.0;
+#if !TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+  imageScale = image.scale; // [TODO(macOS ISS#2323203) // no .scale prop on NSImage
+#endif // [TODO(macOS ISS#2323203)
+  NSInteger singleImageBytes = image.size.width * image.size.height * imageScale * imageScale * 4;
   if (keyFrameAnimation) {
     return keyFrameAnimation.values.count * singleImageBytes;
   } else {
+#if !TARGET_OS_OSX // [TODO(macOS ISS#2323203)
     return image.images ? image.images.count * singleImageBytes : singleImageBytes;
+#else // [TODO(macOS ISS#2323203)
+    return singleImageBytes; // [TODO(macOS ISS#2323203)
+#endif // [TODO(macOS ISS#2323203)
   }
 }
 
@@ -736,14 +745,16 @@ static UIImage *RCTResizeImageIfNeeded(UIImage *image,
           // Decompress the image data (this may be CPU and memory intensive)
           UIImage *image = RCTDecodeImageWithData(data, size, scale, resizeMode);
 
-#if RCT_DEV
-          CGSize imagePixelSize = RCTSizeInPixels(image.size, image.scale);
-          CGSize screenPixelSize = RCTSizeInPixels(RCTScreenSize(), RCTScreenScale());
-          if (imagePixelSize.width * imagePixelSize.height >
-              screenPixelSize.width * screenPixelSize.height) {
-            RCTLogInfo(@"[PERF ASSETS] Loading image at size %@, which is larger "
-                       "than the screen size %@", NSStringFromCGSize(imagePixelSize),
-                       NSStringFromCGSize(screenPixelSize));
+#if !TARGET_OS_OSX && RCT_DEV // TODO(macOS ISS#2323203)
+          if ([[self->_bridge devSettings] isDevModeEnabled]) { // TODO(OSS Candidate ISS#2710739)
+            CGSize imagePixelSize = RCTSizeInPixels(image.size, image.scale);
+            CGSize screenPixelSize = RCTSizeInPixels(RCTScreenSize(), RCTScreenScale());
+            if (imagePixelSize.width * imagePixelSize.height >
+                screenPixelSize.width * screenPixelSize.height) {
+                RCTLogInfo(@"[PERF ASSETS] Loading image at size %@, which is larger "
+                            "than the screen size %@", NSStringFromCGSize(imagePixelSize),
+                            NSStringFromCGSize(screenPixelSize));
+            }
           }
 #endif
 
@@ -826,9 +837,10 @@ static UIImage *RCTResizeImageIfNeeded(UIImage *image,
       }
     } else {
       UIImage *image = imageOrData;
+      CGFloat imageScale = UIImageGetScale(image); // TODO(macOS ISS#2323203)
       size = (CGSize){
-        image.size.width * image.scale,
-        image.size.height * image.scale,
+          image.size.width * imageScale, // TODO(macOS ISS#2323203)
+          image.size.height * imageScale, // TODO(macOS ISS#2323203)
       };
     }
     callback(error, size);
@@ -923,12 +935,12 @@ static UIImage *RCTResizeImageIfNeeded(UIImage *image,
 
     NSString *mimeType = nil;
     NSData *imageData = nil;
-    if (RCTImageHasAlpha(image.CGImage)) {
-      mimeType = @"image/png";
-      imageData = UIImagePNGRepresentation(image);
+    if (RCTUIImageHasAlpha(image)) { // TODO(macOS ISS#2323203)
+        mimeType = @"image/png";
+        imageData = UIImagePNGRepresentation(image);
     } else {
-      mimeType = @"image/jpeg";
-      imageData = UIImageJPEGRepresentation(image, 1.0);
+        mimeType = @"image/jpeg";
+        imageData = UIImageJPEGRepresentation(image, 1.0);
     }
 
     NSURLResponse *response = [[NSURLResponse alloc] initWithURL:request.URL
