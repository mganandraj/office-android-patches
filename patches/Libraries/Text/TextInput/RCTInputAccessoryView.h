--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\TextInput\\RCTInputAccessoryView.h"	2020-01-30 13:55:47.997608400 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Text\\TextInput\\RCTInputAccessoryView.h"	2020-01-29 14:10:09.000883500 -0800
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
 
