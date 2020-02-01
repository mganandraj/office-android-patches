diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\PushNotificationIOS\\RCTPushNotificationManager.m" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\PushNotificationIOS\\RCTPushNotificationManager.m"
index b028074..53b10c4 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\PushNotificationIOS\\RCTPushNotificationManager.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\PushNotificationIOS\\RCTPushNotificationManager.m"
@@ -7,7 +7,9 @@
 
 #import "RCTPushNotificationManager.h"
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 #import <UserNotifications/UserNotifications.h>
+#endif // TODO(macOS ISS#2323203)
 
 #import <React/RCTBridge.h>
 #import <React/RCTConvert.h>
@@ -40,12 +42,15 @@ RCT_ENUM_CONVERTER(NSCalendarUnit,
 
 @end
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 @interface RCTPushNotificationManager ()
 @property (nonatomic, strong) NSMutableDictionary *remoteNotificationCallbacks;
 @end
+#endif // TODO(macOS ISS#2323203)
 
 @implementation RCTConvert (UILocalNotification)
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 + (UILocalNotification *)UILocalNotification:(id)json
 {
   NSDictionary<NSString *, id> *details = [self NSDictionary:json];
@@ -66,12 +71,50 @@ RCT_ENUM_CONVERTER(NSCalendarUnit,
   }
   return notification;
 }
+#else // [TODO(macOS ISS#2323203)
++ (NSUserNotification *)NSUserNotification:(id)json
+{
+  NSDictionary<NSString *, id> *details = [self NSDictionary:json];
+  BOOL isSilent = [RCTConvert BOOL:details[@"isSilent"]];
+  NSUserNotification *notification = [NSUserNotification new];
+  notification.deliveryDate = [RCTConvert NSDate:details[@"fireDate"]] ?: [NSDate date];
+  notification.informativeText = [RCTConvert NSString:details[@"alertBody"]];
+  NSString *title = [RCTConvert NSString:details[@"alertTitle"]];
+  if (title) {
+    notification.title = title;
+  }
+  NSString *actionButtonTitle = [RCTConvert NSString:details[@"alertAction"]];
+  if (actionButtonTitle) {
+    notification.actionButtonTitle = actionButtonTitle;
+  }
+  notification.userInfo = [RCTConvert NSDictionary:details[@"userInfo"]];
+  
+  NSCalendarUnit calendarUnit = [RCTConvert NSCalendarUnit:details[@"repeatInterval"]];
+  if (calendarUnit > 0) {
+    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
+    [dateComponents setValue:1 forComponent:calendarUnit];
+    notification.deliveryRepeatInterval = dateComponents;
+  }
+  if (!isSilent) {
+    notification.soundName = [RCTConvert NSString:details[@"soundName"]] ?: NSUserNotificationDefaultSoundName;
+  }
+  
+  NSString *identifier = [RCTConvert NSString:details[@"identifier"]];
+  if (identifier == nil) {
+    identifier = [[NSUUID UUID] UUIDString];
+  }
+  notification.identifier = identifier;
+  return notification;
+}
+#endif
 
+#if !TARGET_OS_OSX // ]TODO(macOS ISS#2323203)
 RCT_ENUM_CONVERTER(UIBackgroundFetchResult, (@{
   @"UIBackgroundFetchResultNewData": @(UIBackgroundFetchResultNewData),
   @"UIBackgroundFetchResultNoData": @(UIBackgroundFetchResultNoData),
   @"UIBackgroundFetchResultFailed": @(UIBackgroundFetchResultFailed),
 }), UIBackgroundFetchResultNoData, integerValue)
+#endif // TODO(macOS ISS#2323203)
 
 @end
 #endif //TARGET_OS_TV
@@ -81,7 +124,7 @@ RCT_ENUM_CONVERTER(UIBackgroundFetchResult, (@{
   RCTPromiseResolveBlock _requestPermissionsResolveBlock;
 }
 
-#if !TARGET_OS_TV
+#if !TARGET_OS_TV && !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 
 static NSDictionary *RCTFormatLocalNotification(UILocalNotification *notification)
 {
@@ -126,6 +169,26 @@ static NSDictionary *RCTFormatUNNotification(UNNotification *notification)
 }
 
 #endif //TARGET_OS_TV
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+
+static NSDictionary *RCTFormatUserNotification(NSUserNotification *notification)
+{
+  NSMutableDictionary *formattedUserNotification = [NSMutableDictionary dictionary];
+  if (notification.deliveryDate) {
+    NSDateFormatter *formatter = [NSDateFormatter new];
+    [formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"];
+    NSString *fireDateString = [formatter stringFromDate:notification.deliveryDate];
+    formattedUserNotification[@"fireDate"] = fireDateString;
+  }
+  formattedUserNotification[@"alertAction"] = RCTNullIfNil(notification.actionButtonTitle);
+  formattedUserNotification[@"alertBody"] = RCTNullIfNil(notification.informativeText);
+  formattedUserNotification[@"soundName"] = RCTNullIfNil(notification.soundName);
+  formattedUserNotification[@"userInfo"] = RCTNullIfNil(RCTJSONClean(notification.userInfo));
+  formattedUserNotification[@"remote"] = @(notification.isRemote);
+  formattedUserNotification[@"identifier"] = notification.identifier;
+  return formattedUserNotification;
+}
+#endif // ]TODO(macOS ISS#2323203)
 
 RCT_EXPORT_MODULE()
 
@@ -172,6 +235,7 @@ RCT_EXPORT_MODULE()
            @"remoteNotificationRegistrationError"];
 }
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 + (void)didRegisterUserNotificationSettings:(__unused UIUserNotificationSettings *)notificationSettings
 {
   if ([UIApplication instancesRespondToSelector:@selector(registerForRemoteNotifications)]) {
@@ -181,9 +245,16 @@ RCT_EXPORT_MODULE()
                                                       userInfo:@{@"notificationSettings": notificationSettings}];
   }
 }
+#endif // TODO(macOS ISS#2323203)
 
 + (void)didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
 {
+#if TARGET_OS_OSX // [TODO(macOS ISS#2323203)
+  [[NSNotificationCenter defaultCenter] postNotificationName:kRegisterUserNotificationSettings
+                                                      object:self
+                                                    userInfo:@{@"notificationSettings": @(RCTSharedApplication().enabledRemoteNotificationTypes)}];
+#endif // ]TODO(macOS ISS#2323203)
+  
   NSMutableString *hexString = [NSMutableString string];
   NSUInteger deviceTokenLength = deviceToken.length;
   const unsigned char *bytes = deviceToken.bytes;
@@ -210,6 +281,7 @@ RCT_EXPORT_MODULE()
                                                     userInfo:userInfo];
 }
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 + (void)didReceiveRemoteNotification:(NSDictionary *)notification
               fetchCompletionHandler:(RCTRemoteNotificationCallback)completionHandler
 {
@@ -226,6 +298,19 @@ RCT_EXPORT_MODULE()
                                                     userInfo:RCTFormatLocalNotification(notification)];
 }
 
+#else // [TODO(macOS ISS#2323203)
+
++ (void)didReceiveUserNotification:(NSUserNotification *)notification
+{
+  NSString *notificationName = notification.isRemote ? RCTRemoteNotificationReceived : kLocalNotificationReceived;
+  NSDictionary *userInfo = notification.isRemote ? @{@"notification": notification.userInfo} : RCTFormatUserNotification(notification);
+  [[NSNotificationCenter defaultCenter] postNotificationName:notificationName
+                                                      object:self
+                                                    userInfo:userInfo];
+}
+
+#endif // ]TODO(macOS ISS#2323203)
+
 - (void)handleLocalNotificationReceived:(NSNotification *)notification
 {
   [self sendEventWithName:@"localNotificationReceived" body:notification.userInfo];
@@ -234,10 +319,13 @@ RCT_EXPORT_MODULE()
 - (void)handleRemoteNotificationReceived:(NSNotification *)notification
 {
   NSMutableDictionary *remoteNotification = [NSMutableDictionary dictionaryWithDictionary:notification.userInfo[@"notification"]];
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   RCTRemoteNotificationCallback completionHandler = notification.userInfo[@"completionHandler"];
+#endif // TODO(macOS ISS#2323203)
   NSString *notificationId = [[NSUUID UUID] UUIDString];
   remoteNotification[@"notificationId"] = notificationId;
   remoteNotification[@"remote"] = @YES;
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   if (completionHandler) {
     if (!self.remoteNotificationCallbacks) {
       // Lazy initialization
@@ -245,6 +333,7 @@ RCT_EXPORT_MODULE()
     }
     self.remoteNotificationCallbacks[notificationId] = completionHandler;
   }
+#endif // TODO(macOS ISS#2323203)
 
   [self sendEventWithName:@"remoteNotificationReceived" body:remoteNotification];
 }
@@ -271,12 +360,21 @@ RCT_EXPORT_MODULE()
     return;
   }
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   UIUserNotificationSettings *notificationSettings = notification.userInfo[@"notificationSettings"];
   NSDictionary *notificationTypes = @{
     @"alert": @((notificationSettings.types & UIUserNotificationTypeAlert) > 0),
     @"sound": @((notificationSettings.types & UIUserNotificationTypeSound) > 0),
     @"badge": @((notificationSettings.types & UIUserNotificationTypeBadge) > 0),
   };
+#else // [TODO(macOS ISS#2323203)
+  NSRemoteNotificationType remoteNotificationType = [notification.userInfo[@"notificationSettings"] unsignedIntegerValue];
+  NSDictionary *notificationTypes = @{
+    @"alert": @((remoteNotificationType & NSRemoteNotificationTypeAlert) > 0),
+    @"sound": @((remoteNotificationType & NSRemoteNotificationTypeSound) > 0),
+    @"badge": @((remoteNotificationType & NSRemoteNotificationTypeBadge) > 0),
+  };
+#endif // ]TODO(macOS ISS#2323203)
 
   _requestPermissionsResolveBlock(notificationTypes);
   // Clean up listener added in requestPermissions
@@ -284,6 +382,7 @@ RCT_EXPORT_MODULE()
   _requestPermissionsResolveBlock = nil;
 }
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 RCT_EXPORT_METHOD(onFinishRemoteNotification:(NSString *)notificationId fetchResult:(UIBackgroundFetchResult)result) {
   RCTRemoteNotificationCallback completionHandler = self.remoteNotificationCallbacks[notificationId];
   if (!completionHandler) {
@@ -293,13 +392,20 @@ RCT_EXPORT_METHOD(onFinishRemoteNotification:(NSString *)notificationId fetchRes
   completionHandler(result);
   [self.remoteNotificationCallbacks removeObjectForKey:notificationId];
 }
+#endif // TODO(macOS ISS#2323203)
 
 /**
  * Update the application icon badge number on the home screen
  */
 RCT_EXPORT_METHOD(setApplicationIconBadgeNumber:(NSInteger)number)
 {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   RCTSharedApplication().applicationIconBadgeNumber = number;
+#else // [TODO(macOS ISS#2323203)
+  NSDockTile *tile = [NSApp dockTile];
+  tile.showsApplicationBadge = number > 0;
+  tile.badgeLabel = number > 0 ? [NSString stringWithFormat:@"%ld", number] : nil;
+#endif // ]TODO(macOS ISS#2323203)
 }
 
 /**
@@ -307,17 +413,23 @@ RCT_EXPORT_METHOD(setApplicationIconBadgeNumber:(NSInteger)number)
  */
 RCT_EXPORT_METHOD(getApplicationIconBadgeNumber:(RCTResponseSenderBlock)callback)
 {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   callback(@[@(RCTSharedApplication().applicationIconBadgeNumber)]);
+#else // [TODO(macOS ISS#2323203)
+  callback(@[@([NSApp dockTile].badgeLabel.integerValue)]);
+#endif // ]TODO(macOS ISS#2323203)
 }
 
 RCT_EXPORT_METHOD(requestPermissions:(NSDictionary *)permissions
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject)
 {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   if (RCTRunningInAppExtension()) {
     reject(kErrorUnableToRequestPermissions, nil, RCTErrorWithMessage(@"Requesting push notifications is currently unavailable in an app extension"));
     return;
   }
+#endif // TODO(macOS ISS#2323203)
 
   if (_requestPermissionsResolveBlock != nil) {
     RCTLogError(@"Cannot call requestPermissions twice before the first has returned.");
@@ -328,6 +440,7 @@ RCT_EXPORT_METHOD(requestPermissions:(NSDictionary *)permissions
   [self addListener:@"remoteNotificationsRegistered"];
   _requestPermissionsResolveBlock = resolve;
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   UIUserNotificationType types = UIUserNotificationTypeNone;
   if (permissions) {
     if ([RCTConvert BOOL:permissions[@"alert"]]) {
@@ -346,6 +459,23 @@ RCT_EXPORT_METHOD(requestPermissions:(NSDictionary *)permissions
   UIUserNotificationSettings *notificationSettings =
     [UIUserNotificationSettings settingsForTypes:types categories:nil];
   [RCTSharedApplication() registerUserNotificationSettings:notificationSettings];
+#else // [TODO(macOS ISS#2323203)
+  NSRemoteNotificationType types = NSRemoteNotificationTypeNone;
+  if (permissions) {
+    if ([RCTConvert BOOL:permissions[@"alert"]]) {
+      types |= NSRemoteNotificationTypeAlert;
+    }
+    if ([RCTConvert BOOL:permissions[@"badge"]]) {
+      types |= NSRemoteNotificationTypeBadge;
+    }
+    if ([RCTConvert BOOL:permissions[@"sound"]]) {
+      types |= NSRemoteNotificationTypeSound;
+    }
+  } else {
+    types = NSRemoteNotificationTypeAlert | NSRemoteNotificationTypeBadge | NSRemoteNotificationTypeSound;
+  }
+  [RCTSharedApplication() registerForRemoteNotificationTypes:types];
+#endif // ]TODO(macOS ISS#2323203)
 }
 
 RCT_EXPORT_METHOD(abandonPermissions)
@@ -355,37 +485,72 @@ RCT_EXPORT_METHOD(abandonPermissions)
 
 RCT_EXPORT_METHOD(checkPermissions:(RCTResponseSenderBlock)callback)
 {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   if (RCTRunningInAppExtension()) {
     callback(@[@{@"alert": @NO, @"badge": @NO, @"sound": @NO}]);
     return;
   }
+#endif // TODO(macOS ISS#2323203)
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   NSUInteger types = [RCTSharedApplication() currentUserNotificationSettings].types;
   callback(@[@{
     @"alert": @((types & UIUserNotificationTypeAlert) > 0),
     @"badge": @((types & UIUserNotificationTypeBadge) > 0),
     @"sound": @((types & UIUserNotificationTypeSound) > 0),
   }]);
+#else // [TODO(macOS ISS#2323203)
+  NSRemoteNotificationType types = RCTSharedApplication().enabledRemoteNotificationTypes;
+  callback(@[@{
+    @"alert": @((types & NSRemoteNotificationTypeAlert) > 0),
+    @"badge": @((types & NSRemoteNotificationTypeBadge) > 0),
+    @"sound": @((types & NSRemoteNotificationTypeSound) > 0),
+  }]);
+#endif // ]TODO(macOS ISS#2323203)
 }
 
+#if !TARGET_OS_OSX
 RCT_EXPORT_METHOD(presentLocalNotification:(UILocalNotification *)notification)
 {
   [RCTSharedApplication() presentLocalNotificationNow:notification];
 }
+#else // [TODO(macOS ISS#2323203)
+RCT_EXPORT_METHOD(presentLocalNotification:(NSUserNotification *)notification)
+{
+  [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:notification];
+}
+#endif // ]TODO(macOS ISS#2323203)
 
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
 RCT_EXPORT_METHOD(scheduleLocalNotification:(UILocalNotification *)notification)
 {
   [RCTSharedApplication() scheduleLocalNotification:notification];
 }
+#else // [TODO(macOS ISS#2323203)
+RCT_EXPORT_METHOD(scheduleLocalNotification:(NSUserNotification *)notification)
+{
+  [[NSUserNotificationCenter defaultUserNotificationCenter] scheduleNotification:notification];
+}
+#endif // ]TODO(macOS ISS#2323203)
 
 RCT_EXPORT_METHOD(cancelAllLocalNotifications)
 {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   [RCTSharedApplication() cancelAllLocalNotifications];
+#else // [TODO(macOS ISS#2323203)
+  for (NSUserNotification *notif in [NSUserNotificationCenter defaultUserNotificationCenter].scheduledNotifications) {
+    [[NSUserNotificationCenter defaultUserNotificationCenter] removeScheduledNotification:notif];
+  }
+#endif // ]TODO(macOS ISS#2323203)
 }
 
 RCT_EXPORT_METHOD(cancelLocalNotifications:(NSDictionary<NSString *, id> *)userInfo)
 {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   for (UILocalNotification *notification in RCTSharedApplication().scheduledLocalNotifications) {
+#else // [TODO(macOS ISS#2323203)
+  for (NSUserNotification *notification in [NSUserNotificationCenter defaultUserNotificationCenter].scheduledNotifications) {
+#endif // ]TODO(macOS ISS#2323203)
     __block BOOL matchesAll = YES;
     NSDictionary<NSString *, id> *notificationInfo = notification.userInfo;
     // Note: we do this with a loop instead of just `isEqualToDictionary:`
@@ -398,15 +563,22 @@ RCT_EXPORT_METHOD(cancelLocalNotifications:(NSDictionary<NSString *, id> *)userI
         *stop = YES;
       }
     }];
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
     if (matchesAll) {
       [RCTSharedApplication() cancelLocalNotification:notification];
     }
+#else // [TODO(macOS ISS#2323203)
+    if ([notification.identifier isEqualToString:userInfo[@"identifier"]] || matchesAll) {
+      [[NSUserNotificationCenter defaultUserNotificationCenter] removeScheduledNotification:notification];
+    }
+#endif // ]TODO(macOS ISS#2323203)
   }
 }
 
 RCT_EXPORT_METHOD(getInitialNotification:(RCTPromiseResolveBlock)resolve
                   reject:(__unused RCTPromiseRejectBlock)reject)
 {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   NSMutableDictionary<NSString *, id> *initialNotification =
     [self.bridge.launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey] mutableCopy];
 
@@ -421,36 +593,66 @@ RCT_EXPORT_METHOD(getInitialNotification:(RCTPromiseResolveBlock)resolve
   } else {
     resolve((id)kCFNull);
   }
+#else // [TODO(macOS ISS#2323203)
+  NSUserNotification *initialNotification = self.bridge.launchOptions[NSApplicationLaunchUserNotificationKey];
+  if (initialNotification) {
+    resolve(RCTFormatUserNotification(initialNotification));
+  } else {
+    resolve((id)kCFNull);
+  }
+#endif // ]TODO(macOS ISS#2323203)
 }
 
 RCT_EXPORT_METHOD(getScheduledLocalNotifications:(RCTResponseSenderBlock)callback)
 {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   NSArray<UILocalNotification *> *scheduledLocalNotifications = RCTSharedApplication().scheduledLocalNotifications;
+#endif // TODO(macOS ISS#2323203)
   NSMutableArray<NSDictionary *> *formattedScheduledLocalNotifications = [NSMutableArray new];
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   for (UILocalNotification *notification in scheduledLocalNotifications) {
     [formattedScheduledLocalNotifications addObject:RCTFormatLocalNotification(notification)];
   }
+#else // [TODO(macOS ISS#2323203)
+  for (NSUserNotification *notification in [NSUserNotificationCenter defaultUserNotificationCenter].scheduledNotifications) {
+    [formattedScheduledLocalNotifications addObject:RCTFormatUserNotification(notification)];
+  }
+#endif // ]TODO(macOS ISS#2323203)
   callback(@[formattedScheduledLocalNotifications]);
 }
 
 RCT_EXPORT_METHOD(removeAllDeliveredNotifications)
 {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   if ([UNUserNotificationCenter class]) {
     UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
     [center removeAllDeliveredNotifications];
   }
+#else // [TODO(macOS ISS#2323203)
+  [[NSUserNotificationCenter defaultUserNotificationCenter] removeAllDeliveredNotifications];
+#endif // ]TODO(macOS ISS#2323203)
 }
 
 RCT_EXPORT_METHOD(removeDeliveredNotifications:(NSArray<NSString *> *)identifiers)
 {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   if ([UNUserNotificationCenter class]) {
     UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
     [center removeDeliveredNotificationsWithIdentifiers:identifiers];
   }
+#else // [TODO(macOS ISS#2323203)
+  NSArray<NSUserNotification*> *notificationsToRemove = [[NSUserNotificationCenter defaultUserNotificationCenter].deliveredNotifications filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(NSUserNotification* evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
+    return [identifiers containsObject:evaluatedObject.identifier];
+  }]];
+  for (NSUserNotification *notification in notificationsToRemove) {
+    [[NSUserNotificationCenter defaultUserNotificationCenter] removeDeliveredNotification:notification];
+  }
+#endif // ]TODO(macOS ISS#2323203)
 }
 
 RCT_EXPORT_METHOD(getDeliveredNotifications:(RCTResponseSenderBlock)callback)
 {
+#if !TARGET_OS_OSX // TODO(macOS ISS#2323203)
   if ([UNUserNotificationCenter class]) {
     UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
     [center getDeliveredNotificationsWithCompletionHandler:^(NSArray<UNNotification *> *_Nonnull notifications) {
@@ -462,6 +664,13 @@ RCT_EXPORT_METHOD(getDeliveredNotifications:(RCTResponseSenderBlock)callback)
       callback(@[formattedNotifications]);
     }];
   }
+#else // [TODO(macOS ISS#2323203)
+  NSMutableArray<NSDictionary *> *formattedNotifications = [NSMutableArray new];
+  for (NSUserNotification *notification in [NSUserNotificationCenter defaultUserNotificationCenter].deliveredNotifications) {
+    [formattedNotifications addObject:RCTFormatUserNotification(notification)];
+  }
+  callback(@[formattedNotifications]);
+#endif // ]TODO(macOS ISS#2323203)
 }
 
 #else //TARGET_OS_TV
