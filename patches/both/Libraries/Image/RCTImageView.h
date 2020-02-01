diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageView.h" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageView.h"
index 24c56d4..5d78e2d 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageView.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageView.h"
@@ -5,14 +5,28 @@
  * LICENSE file in the root directory of this source tree.
  */
 
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
+#if !TARGET_OS_OSX // [TODO(macOS ISS#2323203)
 #import <UIKit/UIKit.h>
+#endif // [TODO(macOS ISS#2323203)
 #import <React/RCTView.h>
 #import <React/RCTResizeMode.h>
 
 @class RCTBridge;
 @class RCTImageSource;
 
-@interface RCTImageView : RCTView
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+typedef NS_ENUM(NSInteger, UIImageRenderingMode) {
+    UIImageRenderingModeAlwaysOriginal,
+    UIImageRenderingModeAlwaysTemplate,
+};
+#endif
+
+#if !TARGET_OS_OSX // ]TODO(macOS ISS#2323203)
+@interface RCTImageView : UIImageView
+#else // [TODO(macOS ISS#2323203)
+@interface RCTImageView : NSImageView
+#endif // ]TODO(macOS ISS#2323203)
 
 - (instancetype)initWithBridge:(RCTBridge *)bridge NS_DESIGNATED_INITIALIZER;
 
