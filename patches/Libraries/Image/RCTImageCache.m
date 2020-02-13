--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageCache.m"	2020-01-30 13:55:47.905607700 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageCache.m"	2020-01-29 14:10:08.898882100 -0800
@@ -38,6 +38,7 @@
 {
   if (self = [super init]) {
     _decodedImageCache = [NSCache new];
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     _decodedImageCache.totalCostLimit = 20 * 1024 * 1024; // 20 MB
     _cacheStaleTimes = [[NSMutableDictionary alloc] init];
 
@@ -49,6 +50,7 @@
                                              selector:@selector(clearCache)
                                                  name:UIApplicationWillResignActiveNotification
                                                object:nil];
+#endif // TODO(macOS ISS#2323203)
   }
 
   return self;
@@ -59,6 +61,7 @@
   [[NSNotificationCenter defaultCenter] removeObserver:self];
 }
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (void)clearCache
 {
   [_decodedImageCache removeAllObjects];
@@ -66,6 +69,7 @@
     [_cacheStaleTimes removeAllObjects];
   }
 }
+#endif // TODO(macOS ISS#2323203)
 
 - (void)addImageToCache:(UIImage *)image
                  forKey:(NSString *)cacheKey
@@ -73,7 +77,7 @@
   if (!image) {
     return;
   }
-  NSInteger bytes = image.reactDecodedImageBytes;
+  NSInteger bytes = image.reactDecodedImageBytes; // TODO(macOS ISS#2323203)
   if (bytes <= RCTMaxCachableDecodedImageSizeInBytes) {
     [self->_decodedImageCache setObject:image
                                  forKey:cacheKey
