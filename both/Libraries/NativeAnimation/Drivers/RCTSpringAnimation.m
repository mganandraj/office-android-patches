diff --git a/E:/github/ms-react-native-forpatch/Libraries/NativeAnimation/Drivers/RCTSpringAnimation.m b/E:/github/fb-react-native-forpatch/Libraries/NativeAnimation/Drivers/RCTSpringAnimation.m
index 5f05e326c..179a18787 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/NativeAnimation/Drivers/RCTSpringAnimation.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/NativeAnimation/Drivers/RCTSpringAnimation.m
@@ -7,7 +7,7 @@
 
 #import "RCTSpringAnimation.h"
 
-#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
+#import <UIKit/UIKit.h>
 
 #import <React/RCTConvert.h>
 #import <React/RCTDefines.h>
