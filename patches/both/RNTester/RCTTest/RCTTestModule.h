--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\RCTTest\\RCTTestModule.h"	2020-01-30 13:55:48.041611400 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\RCTTest\\RCTTestModule.h"	2020-01-29 14:10:09.048883600 -0800
@@ -5,7 +5,7 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 #import <React/RCTBridgeModule.h>
 #import <React/RCTDefines.h>
@@ -28,7 +28,7 @@
 /**
  * This is the view to be snapshotted.
  */
-@property (nonatomic, strong) UIView *view;
+@property (nonatomic, strong) RCTUIView *view; // TODO(macOS ISS#3536887)
 
 /**
  * This is used to give meaningful names to snapshot image files.
