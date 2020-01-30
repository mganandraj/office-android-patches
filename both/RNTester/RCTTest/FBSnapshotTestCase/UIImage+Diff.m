diff --git a/E:/github/ms-react-native-forpatch/RNTester/RCTTest/FBSnapshotTestCase/UIImage+Diff.m b/E:/github/fb-react-native-forpatch/RNTester/RCTTest/FBSnapshotTestCase/UIImage+Diff.m
index 04e7923ff..ac8d99fc1 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/RCTTest/FBSnapshotTestCase/UIImage+Diff.m
+++ b/E:/github/fb-react-native-forpatch/RNTester/RCTTest/FBSnapshotTestCase/UIImage+Diff.m
@@ -22,7 +22,7 @@
   CGContextBeginTransparencyLayer(context, NULL);
   [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
   CGContextSetBlendMode(context, kCGBlendModeDifference);
-  CGContextSetFillColorWithColor(context,[RCTUIColor whiteColor].CGColor); // TODO(macOS ISS#3536887)
+  CGContextSetFillColorWithColor(context,[UIColor whiteColor].CGColor);
   CGContextFillRect(context, CGRectMake(0, 0, self.size.width, self.size.height));
   CGContextEndTransparencyLayer(context);
   UIImage *returnImage = UIGraphicsGetImageFromCurrentImageContext();
