diff --git a/E:/github/ms-react-native-forpatch/Libraries/NativeAnimation/Drivers/RCTDecayAnimation.m b/E:/github/fb-react-native-forpatch/Libraries/NativeAnimation/Drivers/RCTDecayAnimation.m
index 7b45202af..27d4edfc3 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/NativeAnimation/Drivers/RCTDecayAnimation.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/NativeAnimation/Drivers/RCTDecayAnimation.m
@@ -7,7 +7,7 @@
 
 #import "RCTDecayAnimation.h"
 
-#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
+#import <UIKit/UIKit.h>
 #import <React/RCTConvert.h>
 
 #import "RCTAnimationUtils.h"
