diff --git a/E:/github/ms-react-native-forpatch/Libraries/ART/ViewManagers/ARTNodeManager.m b/E:/github/fb-react-native-forpatch/Libraries/ART/ViewManagers/ARTNodeManager.m
index 52bbb86c6..62680975b 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/ART/ViewManagers/ARTNodeManager.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/ART/ViewManagers/ARTNodeManager.m
@@ -18,7 +18,7 @@ RCT_EXPORT_MODULE()
   return [ARTNode new];
 }
 
-- (RCTUIView *)view // TODO(macOS ISS#3536887)
+- (UIView *)view
 {
   return [self node];
 }
