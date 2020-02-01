diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageLoader.h" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageLoader.h"
index 9e5ff9f..3b54dab 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageLoader.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageLoader.h"
@@ -5,7 +5,7 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 #import <React/RCTBridge.h>
 #import <React/RCTResizeMode.h>
