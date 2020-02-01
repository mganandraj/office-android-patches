diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageCache.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageCache.m"
index a6546a7..9089054 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageCache.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageCache.m"
@@ -38,6 +38,7 @@ static NSString *RCTCacheKeyForImage(NSString *imageTag, CGSize size, CGFloat sc
 {
   if (self = [super init]) {
     _decodedImageCache = [NSCache new];
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     _decodedImageCache.totalCostLimit = 20 * 1024 * 1024; // 20 MB
     _cacheStaleTimes = [[NSMutableDictionary alloc] init];
 
@@ -49,6 +50,7 @@ static NSString *RCTCacheKeyForImage(NSString *imageTag, CGSize size, CGFloat sc
                                              selector:@selector(clearCache)
                                                  name:UIApplicationWillResignActiveNotification
                                                object:nil];
+#endif // TODO(macOS ISS#2323203)
   }
 
   return self;
@@ -59,6 +61,7 @@ static NSString *RCTCacheKeyForImage(NSString *imageTag, CGSize size, CGFloat sc
   [[NSNotificationCenter defaultCenter] removeObserver:self];
 }
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (void)clearCache
 {
   [_decodedImageCache removeAllObjects];
@@ -66,6 +69,7 @@ static NSString *RCTCacheKeyForImage(NSString *imageTag, CGSize size, CGFloat sc
     [_cacheStaleTimes removeAllObjects];
   }
 }
+#endif // TODO(macOS ISS#2323203)
 
 - (void)addImageToCache:(UIImage *)image
                  forKey:(NSString *)cacheKey
@@ -73,7 +77,7 @@ static NSString *RCTCacheKeyForImage(NSString *imageTag, CGSize size, CGFloat sc
   if (!image) {
     return;
   }
-  NSInteger bytes = image.reactDecodedImageBytes;
+  NSInteger bytes = image.reactDecodedImageBytes; // TODO(macOS ISS#2323203)
   if (bytes <= RCTMaxCachableDecodedImageSizeInBytes) {
     [self->_decodedImageCache setObject:image
                                  forKey:cacheKey
