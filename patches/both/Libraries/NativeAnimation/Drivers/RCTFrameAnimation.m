diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\NativeAnimation\\Drivers\\RCTFrameAnimation.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\NativeAnimation\\Drivers\\RCTFrameAnimation.m"
index a6dfde5..1ca342a 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\NativeAnimation\\Drivers\\RCTFrameAnimation.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\NativeAnimation\\Drivers\\RCTFrameAnimation.m"
@@ -7,7 +7,7 @@
 
 #import "RCTFrameAnimation.h"
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 #import <React/RCTConvert.h>
 #import <React/RCTDefines.h>
