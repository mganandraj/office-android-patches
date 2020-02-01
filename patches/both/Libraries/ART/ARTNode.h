diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\ART\\ARTNode.h" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\ART\\ARTNode.h"
index 9f38111..2c9b6a0 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\ART\\ARTNode.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\ART\\ARTNode.h"
@@ -13,7 +13,7 @@
  * thread.
  */
 
-@interface ARTNode : UIView
+@interface ARTNode : RCTUIView // TODO(macOS ISS#3536887)
 
 @property (nonatomic, assign) CGFloat opacity;
 
