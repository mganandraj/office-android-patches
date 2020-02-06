--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\RCTTest\\FBSnapshotTestCase\\FBSnapshotTestController.m"	2020-01-30 13:55:48.038612700 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\RCTTest\\FBSnapshotTestCase\\FBSnapshotTestController.m"	2020-01-29 14:10:09.045884000 -0800
@@ -10,8 +10,6 @@
 
 #import <objc/runtime.h>
 
-#import <UIKit/UIKit.h>
-
 #import "UIImage+Compare.h"
 #import "UIImage+Diff.h"
 
@@ -67,7 +65,7 @@
                                  error:(NSError **)errorPtr
 {
   NSString *filePath = [self _referenceFilePathForSelector:selector identifier:identifier];
-  UIImage *image = [UIImage imageWithContentsOfFile:filePath];
+  UIImage *image = UIImageWithContentsOfFile(filePath); // TODO(macOS ISS#2323203)
   if (nil == image && NULL != errorPtr) {
     BOOL exists = [_fileManager fileExistsAtPath:filePath];
     if (!exists) {
@@ -238,11 +236,19 @@
   if (0 < identifier.length) {
     fileName = [fileName stringByAppendingFormat:@"_%@", identifier];
   }
-  if ([[UIScreen mainScreen] scale] > 1.0) {
-    fileName = [fileName stringByAppendingFormat:@"@%.fx", [[UIScreen mainScreen] scale]];
+  CGFloat scale; // [TODO(macOS ISS#2323203)
+#if !TARGET_OS_OSX
+  scale = [[UIScreen mainScreen] scale];
+#else
+  scale = [[NSScreen mainScreen] backingScaleFactor];
+#endif
+  if (scale > 1.0) { // ]TODO(macOS ISS#2323203)
+    fileName = [fileName stringByAppendingFormat:@"@%.fx", scale];
   }
 #if TARGET_OS_TV
   fileName = [fileName stringByAppendingString:@"_tvOS"];
+#elif TARGET_OS_OSX // TODO(macOS ISS#2323203)
+  fileName = [fileName stringByAppendingString:@"_macOS"]; // TODO(macOS ISS#2323203)
 #endif
   fileName = [fileName stringByAppendingPathExtension:@"png"];
   return fileName;
@@ -288,7 +294,7 @@
 
 #pragma mark - Private API
 
-- (BOOL)_performPixelComparisonWithView:(UIView *)view
+- (BOOL)_performPixelComparisonWithView:(RCTUIView *)view // TODO(macOS ISS#3536887)
                                selector:(SEL)selector
                              identifier:(NSString *)identifier
                                   error:(NSError **)errorPtr
@@ -309,7 +315,7 @@
   return NO;
 }
 
-- (BOOL)_recordSnapshotOfView:(UIView *)view
+- (BOOL)_recordSnapshotOfView:(RCTUIView *)view // TODO(macOS ISS#3536887)
                      selector:(SEL)selector
                    identifier:(NSString *)identifier
                         error:(NSError **)errorPtr
@@ -318,15 +324,20 @@
   return [self saveReferenceImage:snapshot selector:selector identifier:identifier error:errorPtr];
 }
 
-- (UIImage *)_snapshotView:(UIView *)view
+- (UIImage *)_snapshotView:(RCTUIView *)view // TODO(macOS ISS#3536887)
 {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   [view layoutIfNeeded];
-
+#else // [TODO(macOS ISS#2323203)
+  [view layoutSubtreeIfNeeded];
+#endif // ]TODO(macOS ISS#2323203)
+  
   CGRect bounds = view.bounds;
 
   NSAssert1(CGRectGetWidth(bounds), @"Zero width for view %@", view);
   NSAssert1(CGRectGetHeight(bounds), @"Zero height for view %@", view);
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   UIGraphicsBeginImageContextWithOptions(bounds.size, NO, 0);
   CGContextRef context = UIGraphicsGetCurrentContext();
   NSAssert1(context, @"Could not generate context for view %@", view);
@@ -342,7 +353,15 @@
 
   UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
   UIGraphicsEndImageContext();
-
+#else // TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+  // The macOS snapshot bitmap will *not* be scaled to the machine's current screen.
+  // The snapshot image is used for integration testing so the consistent scale makes the test results machine independent.
+  NSBitmapImageRep *rep = [view bitmapImageRepForCachingDisplayInRect:bounds];
+  [view cacheDisplayInRect:bounds toBitmapImageRep:rep];
+  UIImage *snapshot = [[NSImage alloc] initWithSize:bounds.size];
+  [snapshot addRepresentation:rep];
+#endif // ]TODO(macOS ISS#2323203)
+  
   return snapshot;
 }
 
