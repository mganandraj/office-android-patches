diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\ART\\ARTNode.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\ART\\ARTNode.m"
index ae1a152..be09b64 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\ART\\ARTNode.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\ART\\ARTNode.m"
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
