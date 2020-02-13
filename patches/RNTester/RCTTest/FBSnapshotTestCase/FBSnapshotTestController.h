--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\RCTTest\\FBSnapshotTestCase\\FBSnapshotTestController.h"	2020-01-30 13:55:48.038612700 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\RCTTest\\FBSnapshotTestCase\\FBSnapshotTestController.h"	2020-01-29 14:10:09.045884000 -0800
@@ -7,7 +7,7 @@
  */
 
 #import <Foundation/Foundation.h>
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 typedef NS_ENUM(NSInteger, FBSnapshotTestControllerErrorCode) {
   FBSnapshotTestControllerErrorCodeUnknown,
@@ -59,7 +59,7 @@
  @param errorPtr An error to log in an XCTAssert() macro if the method fails (missing reference image, images differ, etc).
  @returns YES if the comparison (or saving of the reference image) succeeded.
  */
-- (BOOL)compareSnapshotOfView:(UIView *)view
+- (BOOL)compareSnapshotOfView:(RCTUIView *)view // TODO(macOS ISS#3536887)
                      selector:(SEL)selector
                    identifier:(NSString *)identifier
                         error:(NSError **)errorPtr;
