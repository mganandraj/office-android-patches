--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\RCTTest\\FBSnapshotTestCase\\UIImage+Diff.h"	2020-01-30 13:55:48.039611800 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\RCTTest\\FBSnapshotTestCase\\UIImage+Diff.h"	2020-01-29 14:10:09.046884600 -0800
@@ -5,7 +5,7 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 @interface UIImage (Diff)
 
