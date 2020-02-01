diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTGIFImageDecoder.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTGIFImageDecoder.m"
index a0afd43..e030338 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTGIFImageDecoder.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTGIFImageDecoder.m"
@@ -62,7 +62,11 @@ RCT_EXPORT_MODULE()
         continue;
       }
       if (!image) {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
         image = [UIImage imageWithCGImage:imageRef scale:scale orientation:UIImageOrientationUp];
+#else // [TODO(macOS ISS#2323203)
+        image = [[NSImage alloc] initWithCGImage:imageRef size:size];
+#endif // ]TODO(macOS ISS#2323203)
       }
 
       NSDictionary<NSString *, id> *frameProperties = (__bridge_transfer NSDictionary *)CGImageSourceCopyPropertiesAtIndex(imageSource, i, NULL);
@@ -114,7 +118,11 @@ RCT_EXPORT_MODULE()
     // Don't bother creating an animation
     CGImageRef imageRef = CGImageSourceCreateImageAtIndex(imageSource, 0, NULL);
     if (imageRef) {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
       image = [UIImage imageWithCGImage:imageRef scale:scale orientation:UIImageOrientationUp];
+#else // [TODO(macOS ISS#2323203)
+      image = [[NSImage alloc] initWithCGImage:imageRef size:size];
+#endif // ]TODO(macOS ISS#2323203)
       CFRelease(imageRef);
     }
     CFRelease(imageSource);
