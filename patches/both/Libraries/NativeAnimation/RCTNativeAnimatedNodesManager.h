--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\NativeAnimation\\RCTNativeAnimatedNodesManager.h"	2020-01-30 13:55:47.947607600 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\NativeAnimation\\RCTNativeAnimatedNodesManager.h"	2020-01-29 14:10:08.943882200 -0800
@@ -8,6 +8,9 @@
 #import <Foundation/Foundation.h>
 #import <React/RCTBridgeModule.h>
 #import <React/RCTUIManager.h>
+#import <React/RCTPlatformDisplayLink.h> // TODO(macOS ISS#2323203)
+
+@protocol RCTValueAnimatedNodeObserver;
 
 @protocol RCTValueAnimatedNodeObserver;
 
@@ -17,7 +20,7 @@
 
 - (void)updateAnimations;
 
-- (void)stepAnimations:(nonnull CADisplayLink *)displaylink;
+- (void)stepAnimations:(nonnull RCTPlatformDisplayLink *)displaylink; // TODO(macOS ISS#2323203)
 
 - (BOOL)isNodeManagedByFabric:(nonnull NSNumber *)tag;
 
