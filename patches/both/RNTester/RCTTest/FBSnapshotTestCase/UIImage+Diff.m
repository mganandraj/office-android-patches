diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RCTTest\\FBSnapshotTestCase\\UIImage+Diff.m" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RCTTest\\FBSnapshotTestCase\\UIImage+Diff.m"
index ac8d99f..04e7923 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RCTTest\\FBSnapshotTestCase\\UIImage+Diff.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RCTTest\\FBSnapshotTestCase\\UIImage+Diff.m"
@@ -22,7 +22,7 @@
   CGContextBeginTransparencyLayer(context, NULL);
   [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
   CGContextSetBlendMode(context, kCGBlendModeDifference);
-  CGContextSetFillColorWithColor(context,[UIColor whiteColor].CGColor);
+  CGContextSetFillColorWithColor(context,[RCTUIColor whiteColor].CGColor); // TODO(macOS ISS#3536887)
   CGContextFillRect(context, CGRectMake(0, 0, self.size.width, self.size.height));
   CGContextEndTransparencyLayer(context);
   UIImage *returnImage = UIGraphicsGetImageFromCurrentImageContext();
