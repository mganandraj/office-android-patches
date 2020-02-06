--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\ART\\ARTNode.h"	2020-01-30 13:55:47.814606800 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\ART\\ARTNode.h"	2020-01-29 14:10:08.794880100 -0800
@@ -13,7 +13,7 @@
  * thread.
  */
 
-@interface ARTNode : UIView
+@interface ARTNode : RCTUIView // TODO(macOS ISS#3536887)
 
 @property (nonatomic, assign) CGFloat opacity;
 
