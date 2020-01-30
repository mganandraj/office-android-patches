diff --git a/E:/github/ms-react-native-forpatch/Libraries/ART/ViewManagers/ARTSurfaceViewManager.m b/E:/github/fb-react-native-forpatch/Libraries/ART/ViewManagers/ARTSurfaceViewManager.m
index dd734a377..1a0389793 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/ART/ViewManagers/ARTSurfaceViewManager.m
+++ b/E:/github/fb-react-native-forpatch/Libraries/ART/ViewManagers/ARTSurfaceViewManager.m
@@ -13,7 +13,7 @@
 
 RCT_EXPORT_MODULE()
 
-- (RCTUIView *)view // TODO(macOS ISS#3536887)
+- (UIView *)view
 {
   return [ARTSurfaceView new];
 }
