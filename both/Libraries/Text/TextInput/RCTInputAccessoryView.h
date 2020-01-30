diff --git a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/RCTInputAccessoryView.h b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/RCTInputAccessoryView.h
index acadb9b03..ec1e29170 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Text/TextInput/RCTInputAccessoryView.h
+++ b/E:/github/fb-react-native-forpatch/Libraries/Text/TextInput/RCTInputAccessoryView.h
@@ -5,12 +5,12 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
+#import <UIKit/UIKit.h>
 
 @class RCTBridge;
 @class RCTInputAccessoryViewContent;
 
-@interface RCTInputAccessoryView : RCTUIView // TODO(macOS ISS#3536887)
+@interface RCTInputAccessoryView : UIView
 
 - (instancetype)initWithBridge:(RCTBridge *)bridge;
 
