--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\ART\\ARTSurfaceView.h"	2020-01-30 13:55:47.817607400 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\ART\\ARTSurfaceView.h"	2020-01-29 14:10:08.795880600 -0800
@@ -5,10 +5,10 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 #import "ARTContainer.h"
 
-@interface ARTSurfaceView : UIView <ARTContainer>
+@interface ARTSurfaceView : RCTUIView <ARTContainer> // TODO(macOS ISS#3536887)
 
 @end
