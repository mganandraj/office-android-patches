diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\ART\\ViewManagers\\ARTSurfaceViewManager.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\ART\\ViewManagers\\ARTSurfaceViewManager.m"
index 1a03897..dd734a3 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\ART\\ViewManagers\\ARTSurfaceViewManager.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\ART\\ViewManagers\\ARTSurfaceViewManager.m"
@@ -13,7 +13,7 @@
 
 RCT_EXPORT_MODULE()
 
-- (UIView *)view
+- (RCTUIView *)view // TODO(macOS ISS#3536887)
 {
   return [ARTSurfaceView new];
 }
