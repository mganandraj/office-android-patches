--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\RCTInputAccessoryViewContent.h"	2020-01-30 13:55:47.997608400 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\RCTInputAccessoryViewContent.h"	2020-01-29 14:10:09.000883500 -0800
@@ -5,8 +5,8 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
-@interface RCTInputAccessoryViewContent : UIView
+@interface RCTInputAccessoryViewContent : RCTUIView // TODO(macOS ISS#3536887)
 
 @end
