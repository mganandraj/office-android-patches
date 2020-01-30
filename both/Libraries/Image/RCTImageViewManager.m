diff --git a/E:/github/ms-react-native-forpatch/Libraries/Image/RCTImageViewManager.m b/E:/github/fb-react-native-forpatch/Libraries/Image/RCTImageViewManager.m
index 60a3e3d39..7d92500f4 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Image/RCTImageViewManager.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/Image/RCTImageViewManager.m
@@ -7,7 +7,7 @@
 
 #import "RCTImageViewManager.h"
 
-#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
+#import <UIKit/UIKit.h>
 
 #import <React/RCTConvert.h>
 #import <React/RCTImageSource.h>
@@ -25,7 +25,7 @@ RCT_EXPORT_MODULE()
   return [RCTImageShadowView new];
 }
 
-- (RCTPlatformView *)view // TODO(macOS ISS#2323203)
+- (UIView *)view
 {
   return [[RCTImageView alloc] initWithBridge:self.bridge];
 }
@@ -41,7 +41,6 @@ RCT_EXPORT_VIEW_PROPERTY(onLoad, RCTDirectEventBlock)
 RCT_EXPORT_VIEW_PROPERTY(onLoadEnd, RCTDirectEventBlock)
 RCT_EXPORT_VIEW_PROPERTY(resizeMode, RCTResizeMode)
 RCT_REMAP_VIEW_PROPERTY(source, imageSources, NSArray<RCTImageSource *>);
-#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 RCT_CUSTOM_VIEW_PROPERTY(tintColor, UIColor, RCTImageView)
 {
   // Default tintColor isn't nil - it's inherited from the superView - but we
@@ -50,7 +49,6 @@ RCT_CUSTOM_VIEW_PROPERTY(tintColor, UIColor, RCTImageView)
   view.tintColor = [RCTConvert UIColor:json] ?: defaultView.tintColor;
   view.renderingMode = json ? UIImageRenderingModeAlwaysTemplate : defaultView.renderingMode;
 }
-#endif // TODO(macOS ISS#2323203)
 
 RCT_EXPORT_METHOD(getSize:(NSURLRequest *)request
                   successBlock:(RCTResponseSenderBlock)successBlock
