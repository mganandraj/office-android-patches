diff --git a/E:/github/ms-react-native-forpatch/Libraries/ART/ARTSurfaceView.m b/E:/github/fb-react-native-forpatch/Libraries/ART/ARTSurfaceView.m
index 8fbbda8ac..7e033690d 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/ART/ARTSurfaceView.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/ART/ARTSurfaceView.m
@@ -22,14 +22,14 @@
   return self;
 }
 
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
@@ -47,9 +47,6 @@
 
 - (void)drawRect:(CGRect)rect
 {
-// [TODO(OSS Candidate ISS#2710739): for macOS and iOS dark mode
-  [super drawRect:rect];
-// ]TODO(OSS Candidate ISS#2710739)
   CGContextRef context = UIGraphicsGetCurrentContext();
   for (ARTNode *node in self.subviews) {
     [node renderTo:context];
