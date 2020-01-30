diff --git a/E:/github/ms-react-native-forpatch/Libraries/NativeAnimation/RCTNativeAnimatedNodesManager.m b/E:/github/fb-react-native-forpatch/Libraries/NativeAnimation/RCTNativeAnimatedNodesManager.m
index 0cf4fb3e3..1a47f1b7a 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/NativeAnimation/RCTNativeAnimatedNodesManager.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/NativeAnimation/RCTNativeAnimatedNodesManager.m
@@ -36,7 +36,7 @@
   // there will be only one driver per mapping so all code code should be optimized around that.
   NSMutableDictionary<NSString *, NSMutableArray<RCTEventAnimation *> *> *_eventDrivers;
   NSMutableSet<id<RCTAnimationDriver>> *_activeAnimations;
-  RCTPlatformDisplayLink *_displayLink; // TODO(macOS ISS#2323203)
+  CADisplayLink *_displayLink;
 }
 
 - (instancetype)initWithBridge:(nonnull RCTBridge *)bridge
@@ -394,7 +394,7 @@
 - (void)startAnimationLoopIfNeeded
 {
   if (!_displayLink && _activeAnimations.count > 0) {
-    _displayLink = [RCTPlatformDisplayLink displayLinkWithTarget:self selector:@selector(stepAnimations:)]; // TODO(macOS ISS#2323203)
+    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(stepAnimations:)];
     [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
   }
 }
@@ -414,7 +414,7 @@
   }
 }
 
-- (void)stepAnimations:(RCTPlatformDisplayLink *)displaylink // TODO(macOS ISS#2323203)
+- (void)stepAnimations:(CADisplayLink *)displaylink
 {
   NSTimeInterval time = displaylink.timestamp;
   for (id<RCTAnimationDriver> animationDriver in _activeAnimations) {
