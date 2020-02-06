--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\ART\\ARTSurfaceView.m"	2020-01-30 13:55:47.817607400 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\ART\\ARTSurfaceView.m"	2020-01-29 14:10:08.795880600 -0800
@@ -22,14 +22,14 @@
   return self;
 }
 
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
@@ -47,6 +47,9 @@
 
 - (void)drawRect:(CGRect)rect
 {
+// [TODO(OSS Candidate ISS#2710739): for macOS and iOS dark mode
+  [super drawRect:rect];
+// ]TODO(OSS Candidate ISS#2710739)
   CGContextRef context = UIGraphicsGetCurrentContext();
   for (ARTNode *node in self.subviews) {
     [node renderTo:context];
