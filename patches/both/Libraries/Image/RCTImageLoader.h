--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageLoader.h"	2020-01-30 13:55:47.906607500 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageLoader.h"	2020-01-29 14:10:08.899881900 -0800
@@ -5,7 +5,7 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 #import <React/RCTBridge.h>
 #import <React/RCTResizeMode.h>
