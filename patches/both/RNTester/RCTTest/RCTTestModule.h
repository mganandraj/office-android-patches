diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RCTTest\\RCTTestModule.h" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RCTTest\\RCTTestModule.h"
index 42b0036..4a3be1c 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RCTTest\\RCTTestModule.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RCTTest\\RCTTestModule.h"
@@ -5,7 +5,7 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 #import <React/RCTBridgeModule.h>
 #import <React/RCTDefines.h>
@@ -28,7 +28,7 @@ typedef NS_ENUM(NSInteger, RCTTestStatus) {
 /**
  * This is the view to be snapshotted.
  */
-@property (nonatomic, strong) UIView *view;
+@property (nonatomic, strong) RCTUIView *view; // TODO(macOS ISS#3536887)
 
 /**
  * This is used to give meaningful names to snapshot image files.
