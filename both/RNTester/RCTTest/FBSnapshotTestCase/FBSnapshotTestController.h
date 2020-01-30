diff --git a/E:/github/ms-react-native-forpatch/RNTester/RCTTest/FBSnapshotTestCase/FBSnapshotTestController.h b/E:/github/fb-react-native-forpatch/RNTester/RCTTest/FBSnapshotTestCase/FBSnapshotTestController.h
index 9c252b714..501d5b645 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/RCTTest/FBSnapshotTestCase/FBSnapshotTestController.h
+++ b/E:/github/fb-react-native-forpatch/RNTester/RCTTest/FBSnapshotTestCase/FBSnapshotTestController.h
@@ -7,7 +7,7 @@
  */
 
 #import <Foundation/Foundation.h>
-#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
+#import <UIKit/UIKit.h>
 
 typedef NS_ENUM(NSInteger, FBSnapshotTestControllerErrorCode) {
   FBSnapshotTestControllerErrorCodeUnknown,
@@ -59,7 +59,7 @@ extern NSString *const FBReferenceImageFilePathKey;
  @param errorPtr An error to log in an XCTAssert() macro if the method fails (missing reference image, images differ, etc).
  @returns YES if the comparison (or saving of the reference image) succeeded.
  */
-- (BOOL)compareSnapshotOfView:(RCTUIView *)view // TODO(macOS ISS#3536887)
+- (BOOL)compareSnapshotOfView:(UIView *)view
                      selector:(SEL)selector
                    identifier:(NSString *)identifier
                         error:(NSError **)errorPtr;
