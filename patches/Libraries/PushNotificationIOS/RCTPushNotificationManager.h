--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\PushNotificationIOS\\RCTPushNotificationManager.h"	2020-01-30 13:55:47.959607900 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\PushNotificationIOS\\RCTPushNotificationManager.h"	2020-01-29 14:10:08.953883800 -0800
@@ -11,14 +11,23 @@
 
 @interface RCTPushNotificationManager : RCTEventEmitter
 
+#if !TARGET_OS_OSX // [TODO(macOS ISS#2323203)
 typedef void (^RCTRemoteNotificationCallback)(UIBackgroundFetchResult result);
+#endif // ]TODO(macOS ISS#2323203)
 
 #if !TARGET_OS_TV
+#if !TARGET_OS_OSX // [TODO(macOS ISS#2323203)
 + (void)didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings;
+#endif // ]TODO(macOS ISS#2323203)
 + (void)didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;
 + (void)didReceiveRemoteNotification:(NSDictionary *)notification;
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 + (void)didReceiveRemoteNotification:(NSDictionary *)notification fetchCompletionHandler:(RCTRemoteNotificationCallback)completionHandler;
 + (void)didReceiveLocalNotification:(UILocalNotification *)notification;
+#endif // [TODO(macOS ISS#2323203)
+#if TARGET_OS_OSX
++ (void)didReceiveUserNotification:(NSUserNotification *)notification;
+#endif // ]TODO(macOS ISS#2323203)
 + (void)didFailToRegisterForRemoteNotificationsWithError:(NSError *)error;
 #endif
 
