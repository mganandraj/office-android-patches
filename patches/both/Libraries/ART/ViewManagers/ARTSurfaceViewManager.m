--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\ART\\ViewManagers\\ARTSurfaceViewManager.m"	2020-01-30 13:55:47.825576400 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\ART\\ViewManagers\\ARTSurfaceViewManager.m"	2020-01-29 14:10:08.800879600 -0800
@@ -13,7 +13,7 @@
 
 RCT_EXPORT_MODULE()
 
-- (UIView *)view
+- (RCTUIView *)view // TODO(macOS ISS#3536887)
 {
   return [ARTSurfaceView new];
 }
