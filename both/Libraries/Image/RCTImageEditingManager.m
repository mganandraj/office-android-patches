diff --git a/E:/github/ms-react-native-forpatch/Libraries/Image/RCTImageEditingManager.m b/E:/github/fb-react-native-forpatch/Libraries/Image/RCTImageEditingManager.m
index c38e74ac0..eb87df96f 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Image/RCTImageEditingManager.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/Image/RCTImageEditingManager.m
@@ -7,7 +7,7 @@
 
 #import "RCTImageEditingManager.h"
 
-#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
+#import <UIKit/UIKit.h>
 
 #import <React/RCTConvert.h>
 #import <React/RCTLog.h>
@@ -53,7 +53,7 @@ RCT_EXPORT_METHOD(cropImage:(NSURLRequest *)imageRequest
     CGSize targetSize = rect.size;
     CGRect targetRect = {{-rect.origin.x, -rect.origin.y}, image.size};
     CGAffineTransform transform = RCTTransformFromTargetRect(image.size, targetRect);
-    UIImage *croppedImage = RCTTransformImage(image, targetSize, UIImageGetScale(image), transform); // TODO(macOS ISS#2323203)
+    UIImage *croppedImage = RCTTransformImage(image, targetSize, image.scale, transform);
 
     // Scale image
     if (cropData[@"displaySize"]) {
@@ -61,7 +61,7 @@ RCT_EXPORT_METHOD(cropImage:(NSURLRequest *)imageRequest
       RCTResizeMode resizeMode = [RCTConvert RCTResizeMode:cropData[@"resizeMode"] ?: @"contain"];
       targetRect = RCTTargetRect(croppedImage.size, targetSize, 1, resizeMode);
       transform = RCTTransformFromTargetRect(croppedImage.size, targetRect);
-      croppedImage = RCTTransformImage(croppedImage, targetSize, UIImageGetScale(image), transform); // TODO(macOS ISS#2323203)
+      croppedImage = RCTTransformImage(croppedImage, targetSize, image.scale, transform);
     }
 
     // Store image
