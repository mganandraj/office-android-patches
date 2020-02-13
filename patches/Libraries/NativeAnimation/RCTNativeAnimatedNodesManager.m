--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\NativeAnimation\\RCTNativeAnimatedNodesManager.m"	2020-01-30 13:55:47.947607600 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\NativeAnimation\\RCTNativeAnimatedNodesManager.m"	2020-01-29 14:10:08.943882200 -0800
@@ -36,7 +36,7 @@
   // there will be only one driver per mapping so all code code should be optimized around that.
   NSMutableDictionary<NSString *, NSMutableArray<RCTEventAnimation *> *> *_eventDrivers;
   NSMutableSet<id<RCTAnimationDriver>> *_activeAnimations;
-  CADisplayLink *_displayLink;
+  RCTPlatformDisplayLink *_displayLink; // TODO(macOS ISS#2323203)
 }
 
 - (instancetype)initWithBridge:(nonnull RCTBridge *)bridge
@@ -394,7 +394,7 @@
 - (void)startAnimationLoopIfNeeded
 {
   if (!_displayLink && _activeAnimations.count > 0) {
-    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(stepAnimations:)];
+    _displayLink = [RCTPlatformDisplayLink displayLinkWithTarget:self selector:@selector(stepAnimations:)]; // TODO(macOS ISS#2323203)
     [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
   }
 }
@@ -414,7 +414,7 @@
   }
 }
 
-- (void)stepAnimations:(CADisplayLink *)displaylink
+- (void)stepAnimations:(RCTPlatformDisplayLink *)displaylink // TODO(macOS ISS#2323203)
 {
   NSTimeInterval time = displaylink.timestamp;
   for (id<RCTAnimationDriver> animationDriver in _activeAnimations) {
