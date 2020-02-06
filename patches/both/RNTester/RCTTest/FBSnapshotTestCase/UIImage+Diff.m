--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\RCTTest\\FBSnapshotTestCase\\UIImage+Diff.m"	2020-01-30 13:55:48.040611900 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\RCTTest\\FBSnapshotTestCase\\UIImage+Diff.m"	2020-01-29 14:10:09.046884600 -0800
@@ -22,7 +22,7 @@
   CGContextBeginTransparencyLayer(context, NULL);
   [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
   CGContextSetBlendMode(context, kCGBlendModeDifference);
-  CGContextSetFillColorWithColor(context,[UIColor whiteColor].CGColor);
+  CGContextSetFillColorWithColor(context,[RCTUIColor whiteColor].CGColor); // TODO(macOS ISS#3536887)
   CGContextFillRect(context, CGRectMake(0, 0, self.size.width, self.size.height));
   CGContextEndTransparencyLayer(context);
   UIImage *returnImage = UIGraphicsGetImageFromCurrentImageContext();
