--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageEditingManager.m"	2020-01-30 13:55:47.906607500 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageEditingManager.m"	2020-01-29 14:10:08.899881900 -0800
@@ -7,7 +7,7 @@
 
 #import "RCTImageEditingManager.h"
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 #import <React/RCTConvert.h>
 #import <React/RCTLog.h>
@@ -53,7 +53,7 @@
     CGSize targetSize = rect.size;
     CGRect targetRect = {{-rect.origin.x, -rect.origin.y}, image.size};
     CGAffineTransform transform = RCTTransformFromTargetRect(image.size, targetRect);
-    UIImage *croppedImage = RCTTransformImage(image, targetSize, image.scale, transform);
+    UIImage *croppedImage = RCTTransformImage(image, targetSize, UIImageGetScale(image), transform); // TODO(macOS ISS#2323203)
 
     // Scale image
     if (cropData[@"displaySize"]) {
@@ -61,7 +61,7 @@
       RCTResizeMode resizeMode = [RCTConvert RCTResizeMode:cropData[@"resizeMode"] ?: @"contain"];
       targetRect = RCTTargetRect(croppedImage.size, targetSize, 1, resizeMode);
       transform = RCTTransformFromTargetRect(croppedImage.size, targetRect);
-      croppedImage = RCTTransformImage(croppedImage, targetSize, image.scale, transform);
+      croppedImage = RCTTransformImage(croppedImage, targetSize, UIImageGetScale(image), transform); // TODO(macOS ISS#2323203)
     }
 
     // Store image
