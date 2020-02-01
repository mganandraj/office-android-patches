diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\RCTInputAccessoryView.h" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\RCTInputAccessoryView.h"
index ec1e291..acadb9b 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\RCTInputAccessoryView.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\RCTInputAccessoryView.h"
@@ -5,12 +5,12 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 @class RCTBridge;
 @class RCTInputAccessoryViewContent;
 
-@interface RCTInputAccessoryView : UIView
+@interface RCTInputAccessoryView : RCTUIView // TODO(macOS ISS#3536887)
 
 - (instancetype)initWithBridge:(RCTBridge *)bridge;
 
