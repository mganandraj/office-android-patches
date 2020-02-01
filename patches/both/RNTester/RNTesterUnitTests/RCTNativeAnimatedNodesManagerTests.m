diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTNativeAnimatedNodesManagerTests.m" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTNativeAnimatedNodesManagerTests.m"
index aa22449..629b196 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTNativeAnimatedNodesManagerTests.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTNativeAnimatedNodesManagerTests.m"
@@ -13,10 +13,11 @@
 #import <RCTAnimation/RCTNativeAnimatedNodesManager.h>
 #import <RCTAnimation/RCTValueAnimatedNode.h>
 #import <React/RCTUIManager.h>
+#import <React/RCTPlatformDisplayLink.h>
 
 static const NSTimeInterval FRAME_LENGTH = 1.0 / 60.0;
 
-@interface RCTFakeDisplayLink : CADisplayLink
+@interface RCTFakeDisplayLink : RCTPlatformDisplayLink // TODO(macOS ISS#2323203)
 
 @end
 
@@ -121,6 +122,7 @@ static id RCTPropChecker(NSString *prop, NSNumber *value)
   id _uiManager;
   RCTNativeAnimatedNodesManager *_nodesManager;
   RCTFakeDisplayLink *_displayLink;
+
 }
 
 - (void)setUp
@@ -168,6 +170,7 @@ static id RCTPropChecker(NSString *prop, NSNumber *value)
     [[_uiManager expect] synchronouslyUpdateViewOnUIThread:@1001
                                                   viewName:@"UIView"
                                                      props:RCTPropChecker(@"opacity", frame)];
+    
     [_nodesManager stepAnimations:_displayLink];
     [_uiManager verify];
   }
