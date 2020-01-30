diff --git a/E:/github/ms-react-native-forpatch/Libraries/ART/ARTNode.h b/E:/github/fb-react-native-forpatch/Libraries/ART/ARTNode.h
index 2c9b6a008..9f381115a 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/ART/ARTNode.h
+++ b/E:/github/fb-react-native-forpatch/Libraries/ART/ARTNode.h
@@ -13,7 +13,7 @@
  * thread.
  */
 
-@interface ARTNode : RCTUIView // TODO(macOS ISS#3536887)
+@interface ARTNode : UIView
 
 @property (nonatomic, assign) CGFloat opacity;
 
