diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageStoreManager.h" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageStoreManager.h"
index b196904..5d37eed 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Image\\RCTImageStoreManager.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Image\\RCTImageStoreManager.h"
@@ -3,7 +3,7 @@
 // This source code is licensed under the MIT license found in the
 // LICENSE file in the root directory of this source tree.
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 
 #import <React/RCTBridge.h>
 #import <React/RCTURLRequestHandler.h>
