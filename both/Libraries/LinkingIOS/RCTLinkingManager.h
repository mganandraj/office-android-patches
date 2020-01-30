diff --git a/E:/github/ms-react-native-forpatch/Libraries/LinkingIOS/RCTLinkingManager.h b/E:/github/fb-react-native-forpatch/Libraries/LinkingIOS/RCTLinkingManager.h
index eca3ab02e..21733a7c7 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/LinkingIOS/RCTLinkingManager.h
+++ b/E:/github/fb-react-native-forpatch/Libraries/LinkingIOS/RCTLinkingManager.h
@@ -5,7 +5,7 @@
  * LICENSE file in the root directory of this source tree.
  */
 
-#import <React/RCTUIKit.h> // TODO(macOS ISS#2323203)
+#import <UIKit/UIKit.h>
 #if defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= 12000) /* __IPHONE_12_0 */
 #import <UIKit/UIUserActivity.h>
 #endif
@@ -13,12 +13,6 @@
 
 @interface RCTLinkingManager : RCTEventEmitter
 
-#pragma clang diagnostic push
-#pragma clang diagnostic ignored "-Wnullability-completeness"
-
-#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
-+ (void)getUrlEventHandler:(NSAppleEventDescriptor *)event withReplyEvent:(NSAppleEventDescriptor *)replyEvent;
-#else // ]TODO(macOS ISS#2323203)
 + (BOOL)application:(nonnull UIApplication *)app
             openURL:(nonnull NSURL *)URL
             options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;
@@ -36,8 +30,5 @@
         #else
             (nonnull void (^)(NSArray *_Nullable))restorationHandler;
         #endif
-#endif // TODO(macOS ISS#2323203)
 
 @end
-
-#pragma clang diagnostic pop
