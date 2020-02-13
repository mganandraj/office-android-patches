--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTGIFImageDecoder.m"	2020-01-30 13:55:47.904607600 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTGIFImageDecoder.m"	2020-01-29 14:10:08.897881900 -0800
@@ -62,7 +62,11 @@
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
@@ -114,7 +118,11 @@
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
