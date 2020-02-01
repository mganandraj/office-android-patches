diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\ART\\ViewManagers\\ARTNodeManager.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\ART\\ViewManagers\\ARTNodeManager.m"
index 6268097..52bbb86 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\ART\\ViewManagers\\ARTNodeManager.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\ART\\ViewManagers\\ARTNodeManager.m"
@@ -18,7 +18,7 @@ RCT_EXPORT_MODULE()
   return [ARTNode new];
 }
 
-- (UIView *)view
+- (RCTUIView *)view // TODO(macOS ISS#3536887)
 {
   return [self node];
 }
