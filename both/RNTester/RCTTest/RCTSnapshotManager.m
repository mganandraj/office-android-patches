diff --git a/E:/github/ms-react-native-forpatch/RNTester/RCTTest/RCTSnapshotManager.m b/E:/github/fb-react-native-forpatch/RNTester/RCTTest/RCTSnapshotManager.m
index 883b7e4b9..4536bea7d 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/RCTTest/RCTSnapshotManager.m
+++ b/E:/github/fb-react-native-forpatch/RNTester/RCTTest/RCTSnapshotManager.m
@@ -7,7 +7,7 @@
 
 #import "RCTSnapshotManager.h"
 
-@interface RCTSnapshotView : RCTUIView // TODO(macOS ISS#3536887)
+@interface RCTSnapshotView : UIView
 
 @property (nonatomic, copy) RCTDirectEventBlock onSnapshotReady;
 @property (nonatomic, copy) NSString *testIdentifier;
@@ -35,7 +35,7 @@
 
 RCT_EXPORT_MODULE()
 
-- (RCTUIView *)view // TODO(macOS ISS#3536887)
+- (UIView *)view
 {
   return [RCTSnapshotView new];
 }
