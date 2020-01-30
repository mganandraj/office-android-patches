diff --git a/E:/github/ms-react-native-forpatch/RNTester/RNTesterUnitTests/RCTNativeAnimatedNodesManagerTests.m b/E:/github/fb-react-native-forpatch/RNTester/RNTesterUnitTests/RCTNativeAnimatedNodesManagerTests.m
index 629b1963d..aa2244910 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/RNTesterUnitTests/RCTNativeAnimatedNodesManagerTests.m
+++ b/E:/github/fb-react-native-forpatch/RNTester/RNTesterUnitTests/RCTNativeAnimatedNodesManagerTests.m
@@ -13,11 +13,10 @@
 #import <RCTAnimation/RCTNativeAnimatedNodesManager.h>
 #import <RCTAnimation/RCTValueAnimatedNode.h>
 #import <React/RCTUIManager.h>
-#import <React/RCTPlatformDisplayLink.h>
 
 static const NSTimeInterval FRAME_LENGTH = 1.0 / 60.0;
 
-@interface RCTFakeDisplayLink : RCTPlatformDisplayLink // TODO(macOS ISS#2323203)
+@interface RCTFakeDisplayLink : CADisplayLink
 
 @end
 
@@ -122,7 +121,6 @@ static id RCTPropChecker(NSString *prop, NSNumber *value)
   id _uiManager;
   RCTNativeAnimatedNodesManager *_nodesManager;
   RCTFakeDisplayLink *_displayLink;
-
 }
 
 - (void)setUp
@@ -170,7 +168,6 @@ static id RCTPropChecker(NSString *prop, NSNumber *value)
     [[_uiManager expect] synchronouslyUpdateViewOnUIThread:@1001
                                                   viewName:@"UIView"
                                                      props:RCTPropChecker(@"opacity", frame)];
-    
     [_nodesManager stepAnimations:_displayLink];
     [_uiManager verify];
   }
