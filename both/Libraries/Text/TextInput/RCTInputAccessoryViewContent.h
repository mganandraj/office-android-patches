diff --git a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/RCTInputAccessoryViewContent.h b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/RCTInputAccessoryViewContent.h
index 5631e0e32..09321c89d 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/RCTInputAccessoryViewContent.h
+++ b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/RCTInputAccessoryViewContent.h
@@ -5,8 +5,8 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
+#import <UIKit/UIKit.h>
 
-@interface RCTInputAccessoryViewContent : RCTUIView // TODO(macOS ISS#3536887)
+@interface RCTInputAccessoryViewContent : UIView
 
 @end
