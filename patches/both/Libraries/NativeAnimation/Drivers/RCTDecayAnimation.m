diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\NativeAnimation\\Drivers\\RCTDecayAnimation.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\NativeAnimation\\Drivers\\RCTDecayAnimation.m"
index 27d4edf..7b45202 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\NativeAnimation\\Drivers\\RCTDecayAnimation.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\NativeAnimation\\Drivers\\RCTDecayAnimation.m"
@@ -7,7 +7,7 @@
 
 #import "RCTDecayAnimation.h"
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 #import <React/RCTConvert.h>
 
 #import "RCTAnimationUtils.h"
