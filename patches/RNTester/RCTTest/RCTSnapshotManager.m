--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\RCTTest\\RCTSnapshotManager.m"	2020-01-30 13:55:48.040611900 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\RCTTest\\RCTSnapshotManager.m"	2020-01-29 14:10:09.047883700 -0800
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
