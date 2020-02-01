diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RCTTest\\FBSnapshotTestCase\\FBSnapshotTestController.h" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RCTTest\\FBSnapshotTestCase\\FBSnapshotTestController.h"
index 501d5b6..9c252b7 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RCTTest\\FBSnapshotTestCase\\FBSnapshotTestController.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RCTTest\\FBSnapshotTestCase\\FBSnapshotTestController.h"
@@ -7,7 +7,7 @@
  */
 
 #import <Foundation/Foundation.h>
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 typedef NS_ENUM(NSInteger, FBSnapshotTestControllerErrorCode) {
   FBSnapshotTestControllerErrorCodeUnknown,
@@ -59,7 +59,7 @@ extern NSString *const FBReferenceImageFilePathKey;
  @param errorPtr An error to log in an XCTAssert() macro if the method fails (missing reference image, images differ, etc).
  @returns YES if the comparison (or saving of the reference image) succeeded.
  */
-- (BOOL)compareSnapshotOfView:(UIView *)view
+- (BOOL)compareSnapshotOfView:(RCTUIView *)view // TODO(macOS ISS#3536887)
                      selector:(SEL)selector
                    identifier:(NSString *)identifier
                         error:(NSError **)errorPtr;
