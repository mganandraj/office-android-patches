diff --git a/E:/github/ms-react-native-forpatch/Libraries/NativeAnimation/RCTNativeAnimatedNodesManager.h b/E:/github/fb-react-native-forpatch/Libraries/NativeAnimation/RCTNativeAnimatedNodesManager.h
index fa846f62d..79e954dac 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/NativeAnimation/RCTNativeAnimatedNodesManager.h
+++ b/E:/github/fb-react-native-forpatch/Libraries/NativeAnimation/RCTNativeAnimatedNodesManager.h
@@ -8,9 +8,6 @@
 #import <Foundation/Foundation.h>
 #import <React/RCTBridgeModule.h>
 #import <React/RCTUIManager.h>
-#import <React/RCTPlatformDisplayLink.h> // TODO(macOS ISS#2323203)
-
-@protocol RCTValueAnimatedNodeObserver;
 
 @protocol RCTValueAnimatedNodeObserver;
 
@@ -20,7 +17,7 @@
 
 - (void)updateAnimations;
 
-- (void)stepAnimations:(nonnull RCTPlatformDisplayLink *)displaylink; // TODO(macOS ISS#2323203)
+- (void)stepAnimations:(nonnull CADisplayLink *)displaylink;
 
 - (BOOL)isNodeManagedByFabric:(nonnull NSNumber *)tag;
 
