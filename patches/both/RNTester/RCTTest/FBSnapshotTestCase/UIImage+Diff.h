diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RCTTest\\FBSnapshotTestCase\\UIImage+Diff.h" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RCTTest\\FBSnapshotTestCase\\UIImage+Diff.h"
index 124c3a5..1d9add6 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RCTTest\\FBSnapshotTestCase\\UIImage+Diff.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RCTTest\\FBSnapshotTestCase\\UIImage+Diff.h"
@@ -5,7 +5,7 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 @interface UIImage (Diff)
 
