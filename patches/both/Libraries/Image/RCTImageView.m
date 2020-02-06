--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageView.m"	2020-01-30 13:55:47.909608300 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageView.m"	2020-01-29 14:10:08.902882300 -0800
@@ -34,6 +34,54 @@
     heightMultiplier > upscaleThreshold || heightMultiplier < downscaleThreshold;
 }
 
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+/**
+ * Implements macOS equivalent behavior of UIViewContentModeScaleAspectFill.
+ * Used for RCTResizeModeCover support.
+ */
+static NSImage *RCTFillImagePreservingAspectRatio(NSImage *originalImage, NSSize targetSize, CGFloat windowScale)
+{
+  RCTAssertParam(originalImage);
+  if (!originalImage) {
+    return nil;
+  }
+
+  NSSize originalImageSize = originalImage.size;
+  if (NSEqualSizes(originalImageSize, NSZeroSize) || [[originalImage representations] count] == 0) {
+    return originalImage;
+  }
+
+  CGFloat scaleX = targetSize.width / originalImageSize.width;
+  CGFloat scaleY = targetSize.height / originalImageSize.height;
+  CGFloat scale = 1.0;
+
+  if (scaleX < scaleY) {
+    // clamped width
+    scale = scaleY;
+  }
+  else {
+    // clamped height
+    scale = scaleX;
+  }
+
+  NSSize newSize = NSMakeSize(RCTRoundPixelValue(originalImageSize.width * scale, windowScale),
+                              RCTRoundPixelValue(originalImageSize.height * scale, windowScale));
+  NSImage *newImage = [[NSImage alloc] initWithSize:newSize];
+
+  for (NSImageRep *imageRep in [originalImage representations]) {
+    NSImageRep *newImageRep = [imageRep copy];
+    NSSize newImageRepSize = NSMakeSize(RCTRoundPixelValue(imageRep.size.width * scale, windowScale),
+                                        RCTRoundPixelValue(imageRep.size.height * scale, windowScale));
+
+    newImageRep.size = newImageRepSize;
+
+    [newImage addRepresentation:newImageRep];
+  }
+
+  return newImage;
+}
+#endif // ]TODO(macOS ISS#2323203)
+
 /**
  * See RCTConvert (ImageSource). We want to send down the source as a similar
  * JSON parameter.
@@ -78,15 +126,32 @@
 
   // Whether the latest change of props requires the image to be reloaded
   BOOL _needsReload;
-
-   UIImageView *_imageView;
+  
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+  // Whether observing changes to the window's backing scale
+  BOOL _subscribedToWindowBackingNotifications;
+#endif // ]TODO(macOS ISS#2323203)
+
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+  NSImageView *_imageView;
+#else
+  UIImageView *_imageView;
+#endif // [TODO(macOS ISS#2323203)
 }
 
 - (instancetype)initWithBridge:(RCTBridge *)bridge
 {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   if ((self = [super initWithFrame:CGRectZero])) {
+#else // [TODO(macOS ISS#2323203)
+  if ((self = [super initWithFrame:NSZeroRect])) {
+#endif // ]TODO(macOS ISS#2323203)
     _bridge = bridge;
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+    self.wantsLayer = YES;
+#endif
 
+#if !TARGET_OS_OSX // ]TODO(macOS ISS#2323203)
     NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
     [center addObserver:self
                selector:@selector(clearImageIfDetached)
@@ -99,6 +164,7 @@
     _imageView = [[UIImageView alloc] init];
     _imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
     [self addSubview:_imageView];
+#endif // TODO(macOS ISS#2323203)
   }
   return self;
 }
@@ -110,9 +176,13 @@
 
 RCT_NOT_IMPLEMENTED(- (instancetype)init)
 
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+RCT_NOT_IMPLEMENTED(- (instancetype)initWithCoder:(NSCoder *)coder)
+RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(NSRect)frame)
+#else
 RCT_NOT_IMPLEMENTED(- (instancetype)initWithCoder:(NSCoder *)aDecoder)
-
 RCT_NOT_IMPLEMENTED(- (instancetype)initWithFrame:(CGRect)frame)
+#endif // ]TODO(macOS ISS#2323203)
 
 - (void)updateWithImage:(UIImage *)image
 {
@@ -122,15 +192,31 @@
   }
 
   // Apply rendering mode
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   if (_renderingMode != image.renderingMode) {
     image = [image imageWithRenderingMode:_renderingMode];
   }
+#else // [TODO(macOS ISS#2323203)
+  if ((_renderingMode == UIImageRenderingModeAlwaysTemplate) != image.template) {
+    image.template = (_renderingMode == UIImageRenderingModeAlwaysTemplate);
+  }
+#endif // ]TODO(macOS ISS#2323203)
 
   if (_resizeMode == RCTResizeModeRepeat) {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     image = [image resizableImageWithCapInsets:_capInsets resizingMode:UIImageResizingModeTile];
+#else // [TODO(macOS ISS#2323203)
+    image.capInsets = _capInsets;
+    image.resizingMode = NSImageResizingModeTile;
+#endif // ]TODO(macOS ISS#2323203)
   } else if (!UIEdgeInsetsEqualToEdgeInsets(UIEdgeInsetsZero, _capInsets)) {
     // Applying capInsets of 0 will switch the "resizingMode" of the image to "tile" which is undesired
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     image = [image resizableImageWithCapInsets:_capInsets resizingMode:UIImageResizingModeStretch];
+#else // [TODO(macOS ISS#2323203)
+    image.capInsets = _capInsets;
+    image.resizingMode = NSImageResizingModeStretch;
+#endif // ]TODO(macOS ISS#2323203)
   }
 
   // Apply trilinear filtering to smooth out mis-sized images
@@ -144,6 +230,11 @@
 {
   image = image ?: _defaultImage;
   if (image != self.image) {
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+    if (image && _resizeMode == RCTResizeModeCover && !NSEqualSizes(self.bounds.size, NSZeroSize)) {
+      image = RCTFillImagePreservingAspectRatio(image, self.bounds.size, self.window.backingScaleFactor ?: 1.0);
+    }
+#endif // ]TODO(macOS ISS#2323203)
     [self updateWithImage:image];
   }
 }
@@ -199,9 +290,21 @@
     if (_resizeMode == RCTResizeModeRepeat) {
       // Repeat resize mode is handled by the UIImage. Use scale to fill
       // so the repeated image fills the UIImageView.
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
       _imageView.contentMode = UIViewContentModeScaleToFill;
+#else // [TODO(macOS ISS#2323203)
+      self.imageScaling = NSImageScaleAxesIndependently;
+#endif // ]TODO(macOS ISS#2323203)
     } else {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
       _imageView.contentMode = (UIViewContentMode)resizeMode;
+#else // [TODO(macOS ISS#2323203)
+      // This relies on having previously resampled the image to a size that exceeds the iamge view.
+      if (resizeMode == RCTResizeModeCover) {
+        resizeMode = RCTResizeModeCenter;
+      }
+      self.imageScaling = (NSImageScaling)resizeMode;
+#endif // ]TODO(macOS ISS#2323203)
     }
 
     if ([self shouldReloadImageSourceAfterResize]) {
@@ -229,12 +332,14 @@
   _imageSource = nil;
 }
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 - (void)clearImageIfDetached
 {
   if (!self.window) {
     [self clearImage];
   }
 }
+#endif // TODO(macOS ISS#2323203)
 
 - (BOOL)hasMultipleSources
 {
@@ -252,7 +357,11 @@
     return nil;
   }
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   const CGFloat scale = RCTScreenScale();
+#else // [TODO(macOS ISS#2323203)
+  const CGFloat scale = self.window != nil ? self.window.backingScaleFactor : [NSScreen mainScreen].backingScaleFactor;
+#endif // ]TODO(macOS ISS#2323203)
   const CGFloat targetImagePixels = size.width * size.height * scale * scale;
 
   RCTImageSource *bestSource = nil;
@@ -315,7 +424,11 @@
     };
 
     CGSize imageSize = self.bounds.size;
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     CGFloat imageScale = RCTScreenScale();
+#else // [TODO(macOS ISS#2323203)
+    CGFloat imageScale = self.window != nil ? self.window.backingScaleFactor : [NSScreen mainScreen].backingScaleFactor;
+#endif // ]TODO(macOS ISS#2323203)
     if (!UIEdgeInsetsEqualToEdgeInsets(_capInsets, UIEdgeInsetsZero)) {
       // Don't resize images that use capInsets
       imageSize = CGSizeZero;
@@ -370,7 +483,12 @@
         return;
       }
       // Apply renderingMode to animated image.
+#if TARGET_OS_OSX // TODO(macOS ISS#2323203)
+      // NSImages don't have rendering modes, so ignore
+      self->_imageView.image = [[NSImage alloc] initWithCGImage:posterImageRef size:NSZeroSize /* shorthand for same size as CGImageRef */];
+#else // TODO(macOS ISS#2323203)
       self->_imageView.image = [[UIImage imageWithCGImage:posterImageRef] imageWithRenderingMode:self->_renderingMode];
+#endif // TODO(macOS ISS#2323203)
       [self->_imageView.layer addAnimation:image.reactKeyframeAnimation forKey:@"contents"];
     } else {
       self.image = image;
@@ -421,13 +539,31 @@
     [self reloadImage];
   } else if ([self shouldReloadImageSourceAfterResize]) {
     CGSize imageSize = self.image.size;
-    CGFloat imageScale = self.image.scale;
-    CGSize idealSize = RCTTargetSize(imageSize, imageScale, frame.size, RCTScreenScale(),
-                                     (RCTResizeMode)self.contentMode, YES);
-
+    CGFloat imageScale = UIImageGetScale(self.image); // [TODO(macOS ISS#2323203)
+#if !TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+    CGFloat windowScale = RCTScreenScale();
+    RCTResizeMode resizeMode = (RCTResizeMode)_imageView.contentMode;
+#else // [TODO(macOS ISS#2323203)
+    CGFloat windowScale = self.window != nil ? self.window.backingScaleFactor : [NSScreen mainScreen].backingScaleFactor;
+    RCTResizeMode resizeMode = self.resizeMode;
+
+    // self.contentMode on iOS is translated to RCTResizeModeRepeat in -setResizeMode:
+    if (resizeMode == RCTResizeModeRepeat) {
+      resizeMode = RCTResizeModeStretch;
+    }
+#endif // [TODO(macOS ISS#2323203)
+    CGSize idealSize = RCTTargetSize(imageSize, imageScale, frame.size, windowScale,
+                                     resizeMode, YES); // ]TODO(macOS ISS#2323203)
     // Don't reload if the current image or target image size is close enough
-    if (!RCTShouldReloadImageForSizeChange(imageSize, idealSize) ||
-        !RCTShouldReloadImageForSizeChange(_targetSize, idealSize)) {
+    if ((!RCTShouldReloadImageForSizeChange(imageSize, idealSize) ||
+         !RCTShouldReloadImageForSizeChange(_targetSize, idealSize)) // [TODO(macOS ISS#2323203)
+#if TARGET_OS_OSX
+         // Since mac doen't suport UIViewContentModeScaleAspectFill, we have to manually resample the image
+         // If we're in cover mode we need to ensure that the image is re-sampled to the correct size when the container size (shrinking 
+         // being the most obvious case) otherwise we will end up in a state an image will not properly scale inside its container
+         && (resizeMode != RCTResizeModeCover || (imageSize.width == idealSize.width && imageSize.height == idealSize.height))
+#endif
+         ) { // ]TODO(macOS ISS#2323203)
       return;
     }
 
@@ -454,10 +590,35 @@
   }
 }
 
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+#define didMoveToWindow viewDidMoveToWindow
+#endif
+#if TARGET_OS_OSX
+- (void)viewWillMoveToWindow:(NSWindow *)newWindow
+{
+  if (_subscribedToWindowBackingNotifications &&
+      self.window != nil &&
+      self.window != newWindow) {
+    [[NSNotificationCenter defaultCenter] removeObserver:self
+                                                    name:NSWindowDidChangeBackingPropertiesNotification
+                                                  object:self.window];
+    _subscribedToWindowBackingNotifications = NO;
+  }
+}
+#endif // ]TODO(macOS ISS#2323203)
 - (void)didMoveToWindow
 {
   [super didMoveToWindow];
 
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+  if (!_subscribedToWindowBackingNotifications && self.window != nil) {
+    [[NSNotificationCenter defaultCenter] addObserver:self
+                                             selector:@selector(windowDidChangeBackingProperties:)
+                                                 name:NSWindowDidChangeBackingPropertiesNotification
+                                               object:self.window];
+    _subscribedToWindowBackingNotifications = YES;
+  }
+#endif // ]TODO(macOS ISS#2323203)
   if (!self.window) {
     // Cancel loading the image if we've moved offscreen. In addition to helping
     // prioritise image requests that are actually on-screen, this removes
@@ -469,4 +630,10 @@
   }
 }
 
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+- (void)windowDidChangeBackingProperties:(NSNotification *)notification
+{
+  [self reloadImage];
+}
+#endif // ]TODO(macOS ISS#2323203)
 @end
