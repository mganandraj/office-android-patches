diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\ART\\ARTSurfaceView.h" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\ART\\ARTSurfaceView.h"
index 34016b9..28d103d 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\ART\\ARTSurfaceView.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\ART\\ARTSurfaceView.h"
@@ -5,10 +5,10 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 #import "ARTContainer.h"
 
-@interface ARTSurfaceView : UIView <ARTContainer>
+@interface ARTSurfaceView : RCTUIView <ARTContainer> // TODO(macOS ISS#3536887)
 
 @end
