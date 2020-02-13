--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\LinkingIOS\\RCTLinkingManager.h"	2020-01-30 13:55:47.921613500 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\LinkingIOS\\RCTLinkingManager.h"	2020-01-29 14:10:08.921882900 -0800
@@ -5,7 +5,7 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <UIKit/UIKit.h>
+#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
 #if defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= 12000) /* __IPHONE_12_0 */
 #import <UIKit/UIUserActivity.h>
 #endif
@@ -13,6 +13,12 @@
 
 @interface RCTLinkingManager : RCTEventEmitter
 
+#pragma clang diagnostic push
+#pragma clang diagnostic ignored "-Wnullability-completeness"
+
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
++ (void)getUrlEventHandler:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent;
+#else // ]TODO(macOS ISS#2323203)
 + (BOOL)application:(nonnull UIApplication *)app
             openURL:(nonnull NSURL *)URL
             options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;
@@ -30,5 +36,8 @@
         #else
             (nonnull void (^)(NSArray *_Nullable))restorationHandler;
         #endif
+#endif // TODO(macOS ISS#2323203)
 
 @end
+
+#pragma clang diagnostic pop
