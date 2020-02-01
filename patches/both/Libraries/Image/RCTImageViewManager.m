diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageViewManager.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageViewManager.m"
index 7d92500..60a3e3d 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageViewManager.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageViewManager.m"
@@ -7,7 +7,7 @@
 
 #import "RCTImageViewManager.h"
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 #import <React/RCTConvert.h>
 #import <React/RCTImageSource.h>
@@ -25,7 +25,7 @@ RCT_EXPORT_MODULE()
   return [RCTImageShadowView new];
 }
 
-- (UIView *)view
+- (RCTPlatformView *)view // TODO(macOS ISS#2323203)
 {
   return [[RCTImageView alloc] initWithBridge:self.bridge];
 }
@@ -41,6 +41,7 @@ RCT_EXPORT_VIEW_PROPERTY(onLoad, RCTDirectEventBlock)
 RCT_EXPORT_VIEW_PROPERTY(onLoadEnd, RCTDirectEventBlock)
 RCT_EXPORT_VIEW_PROPERTY(resizeMode, RCTResizeMode)
 RCT_REMAP_VIEW_PROPERTY(source, imageSources, NSArray<RCTImageSource *>);
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 RCT_CUSTOM_VIEW_PROPERTY(tintColor, UIColor, RCTImageView)
 {
   // Default tintColor isn't nil - it's inherited from the superView - but we
@@ -49,6 +50,7 @@ RCT_CUSTOM_VIEW_PROPERTY(tintColor, UIColor, RCTImageView)
   view.tintColor = [RCTConvert UIColor:json] ?: defaultView.tintColor;
   view.renderingMode = json ? UIImageRenderingModeAlwaysTemplate : defaultView.renderingMode;
 }
+#endif // TODO(macOS ISS#2323203)
 
 RCT_EXPORT_METHOD(getSize:(NSURLRequest *)request
                   successBlock:(RCTResponseSenderBlock)successBlock
