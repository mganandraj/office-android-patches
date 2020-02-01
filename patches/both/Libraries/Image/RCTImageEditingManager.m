diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageEditingManager.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageEditingManager.m"
index eb87df9..c38e74a 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageEditingManager.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageEditingManager.m"
@@ -7,7 +7,7 @@
 
 #import "RCTImageEditingManager.h"
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 #import <React/RCTConvert.h>
 #import <React/RCTLog.h>
@@ -53,7 +53,7 @@ RCT_EXPORT_METHOD(cropImage:(NSURLRequest *)imageRequest
     CGSize targetSize = rect.size;
     CGRect targetRect = {{-rect.origin.x, -rect.origin.y}, image.size};
     CGAffineTransform transform = RCTTransformFromTargetRect(image.size, targetRect);
-    UIImage *croppedImage = RCTTransformImage(image, targetSize, image.scale, transform);
+    UIImage *croppedImage = RCTTransformImage(image, targetSize, UIImageGetScale(image), transform); // TODO(macOS ISS#2323203)
 
     // Scale image
     if (cropData[@"displaySize"]) {
@@ -61,7 +61,7 @@ RCT_EXPORT_METHOD(cropImage:(NSURLRequest *)imageRequest
       RCTResizeMode resizeMode = [RCTConvert RCTResizeMode:cropData[@"resizeMode"] ?: @"contain"];
       targetRect = RCTTargetRect(croppedImage.size, targetSize, 1, resizeMode);
       transform = RCTTransformFromTargetRect(croppedImage.size, targetRect);
-      croppedImage = RCTTransformImage(croppedImage, targetSize, image.scale, transform);
+      croppedImage = RCTTransformImage(croppedImage, targetSize, UIImageGetScale(image), transform); // TODO(macOS ISS#2323203)
     }
 
     // Store image
