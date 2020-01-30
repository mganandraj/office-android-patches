diff --git a/E:/github/ms-react-native-forpatch/Libraries/Image/RCTImageView.h b/E:/github/fb-react-native-forpatch/Libraries/Image/RCTImageView.h
index 5d78e2dd2..24c56d448 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Image/RCTImageView.h
+++ b/E:/github/fb-react-native-forpatch/Libraries/Image/RCTImageView.h
@@ -5,28 +5,14 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
-#if !TARGET_OS_OSX // [TODO(macOS ISS#2323203)
 #import <UIKit/UIKit.h>
-#endif // [TODO(macOS ISS#2323203)
 #import <React/RCTView.h>
 #import <React/RCTResizeMode.h>
 
 @class RCTBridge;
 @class RCTImageSource;
 
-#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
-typedef NS_ENUM(NSInteger, UIImageRenderingMode) {
-    UIImageRenderingModeAlwaysOriginal,
-    UIImageRenderingModeAlwaysTemplate,
-};
-#endif
-
-#if !TARGET_OS_OSX // ]TODO(macOS ISS#2323203)
-@interface RCTImageView : UIImageView
-#else // [TODO(macOS ISS#2323203)
-@interface RCTImageView : NSImageView
-#endif // ]TODO(macOS ISS#2323203)
+@interface RCTImageView : RCTView
 
 - (instancetype)initWithBridge:(RCTBridge *)bridge NS_DESIGNATED_INITIALIZER;
 
