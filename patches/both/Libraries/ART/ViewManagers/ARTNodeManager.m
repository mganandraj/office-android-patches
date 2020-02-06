--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\ART\\ViewManagers\\ARTNodeManager.m"	2020-01-30 13:55:47.823578300 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\ART\\ViewManagers\\ARTNodeManager.m"	2020-01-29 14:10:08.799919000 -0800
@@ -18,7 +18,7 @@
   return [ARTNode new];
 }
 
-- (UIView *)view
+- (RCTUIView *)view // TODO(macOS ISS#3536887)
 {
   return [self node];
 }
