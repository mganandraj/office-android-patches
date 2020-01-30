diff --git a/E:/github/ms-react-native-forpatch/Libraries/Image/RCTImageStoreManager.m b/E:/github/fb-react-native-forpatch/Libraries/Image/RCTImageStoreManager.m
index 1cecbf1c3..03656e4ea 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Image/RCTImageStoreManager.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/Image/RCTImageStoreManager.m
@@ -10,9 +10,7 @@
 #import <stdatomic.h>
 
 #import <ImageIO/ImageIO.h>
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 #import <MobileCoreServices/UTType.h>
-#endif // TODO(macOS ISS#2323203)
 
 #import <React/RCTAssert.h>
 #import <React/RCTLog.h>
@@ -215,7 +213,7 @@ RCT_EXPORT_METHOD(addImageFromBase64:(NSString *)base64String
   dispatch_sync(_methodQueue, ^{
     imageData = self->_store[imageTag];
   });
-  return UIImageWithData(imageData); // TODO(macOS ISS#2323203)
+  return [UIImage imageWithData:imageData];
 }
 
 - (void)getImageForTag:(NSString *)imageTag withBlock:(void (^)(UIImage *image))block
@@ -225,7 +223,7 @@ RCT_EXPORT_METHOD(addImageFromBase64:(NSString *)base64String
     NSData *imageData = self->_store[imageTag];
     dispatch_async(dispatch_get_main_queue(), ^{
       // imageWithData: is not thread-safe, so we can't do this on methodQueue
-      block(UIImageWithData(imageData)); // TODO(macOS ISS#2323203)
+      block([UIImage imageWithData:imageData]);
     });
   });
 }
