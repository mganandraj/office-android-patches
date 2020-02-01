diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\RCTInputAccessoryViewContent.h" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\RCTInputAccessoryViewContent.h"
index 09321c8..5631e0e 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\RCTInputAccessoryViewContent.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\RCTInputAccessoryViewContent.h"
@@ -5,8 +5,8 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
-@interface RCTInputAccessoryViewContent : UIView
+@interface RCTInputAccessoryViewContent : RCTUIView // TODO(macOS ISS#3536887)
 
 @end
