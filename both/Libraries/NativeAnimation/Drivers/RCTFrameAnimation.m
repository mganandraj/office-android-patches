diff --git a/E:/github/ms-react-native-forpatch/Libraries/NativeAnimation/Drivers/RCTFrameAnimation.m b/E:/github/fb-react-native-forpatch/Libraries/NativeAnimation/Drivers/RCTFrameAnimation.m
index 1ca342a95..a6dfde500 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/NativeAnimation/Drivers/RCTFrameAnimation.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/NativeAnimation/Drivers/RCTFrameAnimation.m
@@ -7,7 +7,7 @@
 
 #import "RCTFrameAnimation.h"
 
-#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
+#import <UIKit/UIKit.h>
 
 #import <React/RCTConvert.h>
 #import <React/RCTDefines.h>
