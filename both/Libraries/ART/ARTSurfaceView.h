diff --git a/E:/github/ms-react-native-forpatch/Libraries/ART/ARTSurfaceView.h b/E:/github/fb-react-native-forpatch/Libraries/ART/ARTSurfaceView.h
index 28d103df2..34016b9ea 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/ART/ARTSurfaceView.h
+++ b/E:/github/fb-react-native-forpatch/Libraries/ART/ARTSurfaceView.h
@@ -5,10 +5,10 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
+#import <UIKit/UIKit.h>
 
 #import "ARTContainer.h"
 
-@interface ARTSurfaceView : RCTUIView <ARTContainer> // TODO(macOS ISS#3536887)
+@interface ARTSurfaceView : UIView <ARTContainer>
 
 @end
