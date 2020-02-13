--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTNativeAnimatedNodesManagerTests.m"	2020-01-30 13:55:48.065609200 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTNativeAnimatedNodesManagerTests.m"	2020-01-29 14:10:09.110882900 -0800
@@ -13,10 +13,11 @@
 #import <RCTAnimation/RCTNativeAnimatedNodesManager.h>
 #import <RCTAnimation/RCTValueAnimatedNode.h>
 #import <React/RCTUIManager.h>
+#import <React/RCTPlatformDisplayLink.h>
 
 static const NSTimeInterval FRAME_LENGTH = 1.0 / 60.0;
 
-@interface RCTFakeDisplayLink : CADisplayLink
+@interface RCTFakeDisplayLink : RCTPlatformDisplayLink // TODO(macOS ISS#2323203)
 
 @end
 
@@ -121,6 +122,7 @@
   id _uiManager;
   RCTNativeAnimatedNodesManager *_nodesManager;
   RCTFakeDisplayLink *_displayLink;
+
 }
 
 - (void)setUp
@@ -168,6 +170,7 @@
     [[_uiManager expect] synchronouslyUpdateViewOnUIThread:@1001
                                                   viewName:@"UIView"
                                                      props:RCTPropChecker(@"opacity", frame)];
+    
     [_nodesManager stepAnimations:_displayLink];
     [_uiManager verify];
   }
