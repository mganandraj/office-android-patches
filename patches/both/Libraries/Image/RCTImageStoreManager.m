diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageStoreManager.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageStoreManager.m"
index 03656e4..1cecbf1 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageStoreManager.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageStoreManager.m"
@@ -10,7 +10,9 @@
 #import <stdatomic.h>
 
 #import <ImageIO/ImageIO.h>
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 #import <MobileCoreServices/UTType.h>
+#endif // TODO(macOS ISS#2323203)
 
 #import <React/RCTAssert.h>
 #import <React/RCTLog.h>
@@ -213,7 +215,7 @@ RCT_EXPORT_METHOD(addImageFromBase64:(NSString *)base64String
   dispatch_sync(_methodQueue, ^{
     imageData = self->_store[imageTag];
   });
-  return [UIImage imageWithData:imageData];
+  return UIImageWithData(imageData); // TODO(macOS ISS#2323203)
 }
 
 - (void)getImageForTag:(NSString *)imageTag withBlock:(void (^)(UIImage *image))block
@@ -223,7 +225,7 @@ RCT_EXPORT_METHOD(addImageFromBase64:(NSString *)base64String
     NSData *imageData = self->_store[imageTag];
     dispatch_async(dispatch_get_main_queue(), ^{
       // imageWithData: is not thread-safe, so we can't do this on methodQueue
-      block([UIImage imageWithData:imageData]);
+      block(UIImageWithData(imageData)); // TODO(macOS ISS#2323203)
     });
   });
 }
