diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RCTTest\\RCTSnapshotManager.m" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RCTTest\\RCTSnapshotManager.m"
index 4536bea..883b7e4 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RCTTest\\RCTSnapshotManager.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RCTTest\\RCTSnapshotManager.m"
@@ -7,7 +7,7 @@
 
 #import "RCTSnapshotManager.h"
 
-@interface RCTSnapshotView : UIView
+@interface RCTSnapshotView : RCTUIView // TODO(macOS ISS#3536887)
 
 @property (nonatomic, copy) RCTDirectEventBlock onSnapshotReady;
 @property (nonatomic, copy) NSString *testIdentifier;
@@ -35,7 +35,7 @@
 
 RCT_EXPORT_MODULE()
 
-- (UIView *)view
+- (RCTUIView *)view // TODO(macOS ISS#3536887)
 {
   return [RCTSnapshotView new];
 }
