--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\NativeAnimation\\Drivers\\RCTDecayAnimation.m"	2020-01-30 13:55:47.933607600 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\NativeAnimation\\Drivers\\RCTDecayAnimation.m"	2020-01-29 14:10:08.934882900 -0800
@@ -7,7 +7,7 @@
 
 #import "RCTDecayAnimation.h"
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 #import <React/RCTConvert.h>
 
 #import "RCTAnimationUtils.h"
