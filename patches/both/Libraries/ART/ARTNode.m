--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\ART\\ARTNode.m"	2020-01-30 13:55:47.815608900 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\ART\\ARTNode.m"	2020-01-29 14:10:08.794880100 -0800
@@ -11,14 +11,14 @@
 
 @implementation ARTNode
 
-- (void)insertReactSubview:(UIView *)subview atIndex:(NSInteger)atIndex
+- (void)insertReactSubview:(RCTUIView *)subview atIndex:(NSInteger)atIndex // TODO(macOS ISS#3536887)
 {
   [super insertReactSubview:subview atIndex:atIndex];
   [self insertSubview:subview atIndex:atIndex];
   [self invalidate];
 }
 
-- (void)removeReactSubview:(UIView *)subview
+- (void)removeReactSubview:(RCTUIView *)subview // TODO(macOS ISS#3536887)
 {
   [super removeReactSubview:subview];
   [self invalidate];
