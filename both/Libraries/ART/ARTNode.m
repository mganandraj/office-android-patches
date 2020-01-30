diff --git a/E:/github/ms-react-native-forpatch/Libraries/ART/ARTNode.m b/E:/github/fb-react-native-forpatch/Libraries/ART/ARTNode.m
index be09b6400..ae1a152a7 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/ART/ARTNode.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/ART/ARTNode.m
@@ -11,14 +11,14 @@
 
 @implementation ARTNode
 
-- (void)insertReactSubview:(RCTUIView *)subview atIndex:(NSInteger)atIndex // TODO(macOS ISS#3536887)
+- (void)insertReactSubview:(UIView *)subview atIndex:(NSInteger)atIndex
 {
   [super insertReactSubview:subview atIndex:atIndex];
   [self insertSubview:subview atIndex:atIndex];
   [self invalidate];
 }
 
-- (void)removeReactSubview:(RCTUIView *)subview // TODO(macOS ISS#3536887)
+- (void)removeReactSubview:(UIView *)subview
 {
   [super removeReactSubview:subview];
   [self invalidate];
