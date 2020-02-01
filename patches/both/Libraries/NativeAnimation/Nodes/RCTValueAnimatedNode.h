diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\NativeAnimation\\Nodes\\RCTValueAnimatedNode.h" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\NativeAnimation\\Nodes\\RCTValueAnimatedNode.h"
index 53b5da3..e6ce1ff 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\NativeAnimation\\Nodes\\RCTValueAnimatedNode.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\NativeAnimation\\Nodes\\RCTValueAnimatedNode.h"
@@ -5,7 +5,7 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 #import "RCTAnimatedNode.h"
 
