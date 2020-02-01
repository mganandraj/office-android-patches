diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\Text\\NSTextStorage+FontScaling.h" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\Text\\NSTextStorage+FontScaling.h"
index 1ec019e..bd92277 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Text\\Text\\NSTextStorage+FontScaling.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Text\\Text\\NSTextStorage+FontScaling.h"
@@ -5,7 +5,7 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 @interface NSTextStorage (FontScaling)
 
