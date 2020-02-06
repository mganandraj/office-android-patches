--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\NativeAnimation\\Drivers\\RCTFrameAnimation.m"	2020-01-30 13:55:47.935613900 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\NativeAnimation\\Drivers\\RCTFrameAnimation.m"	2020-01-29 14:10:08.936883800 -0800
@@ -7,7 +7,7 @@
 
 #import "RCTFrameAnimation.h"
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 #import <React/RCTConvert.h>
 #import <React/RCTDefines.h>
