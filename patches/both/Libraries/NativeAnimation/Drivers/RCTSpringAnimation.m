diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\NativeAnimation\\Drivers\\RCTSpringAnimation.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\NativeAnimation\\Drivers\\RCTSpringAnimation.m"
index 179a187..5f05e32 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\NativeAnimation\\Drivers\\RCTSpringAnimation.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\NativeAnimation\\Drivers\\RCTSpringAnimation.m"
@@ -7,7 +7,7 @@
 
 #import "RCTSpringAnimation.h"
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 #import <React/RCTConvert.h>
 #import <React/RCTDefines.h>
