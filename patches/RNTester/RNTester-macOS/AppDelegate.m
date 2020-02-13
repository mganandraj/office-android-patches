--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTester-macOS\\AppDelegate.m"	1969-12-31 16:00:00.000000000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\RNTester-macOS\\AppDelegate.m"	2020-01-29 14:10:09.049883100 -0800
@@ -0,0 +1,104 @@
+//
+//  AppDelegate.m
+//  RNTester-macOS
+//
+//  Created by Jeff Cruikshank on 6/5/17.
+//  Copyright © 2017 Facebook. All rights reserved.
+//
+
+#import "AppDelegate.h"
+
+#import <React/RCTBridge.h>
+#import <React/RCTBundleURLProvider.h>
+#import <React/RCTLinkingManager.h>
+#import <React/RCTPushNotificationManager.h>
+
+const NSString *kBundleNameJS = @"RNTesterApp";
+
+@interface AppDelegate () <RCTBridgeDelegate, NSUserNotificationCenterDelegate>
+
+@end
+
+@implementation AppDelegate
+{
+  NSMutableArray *_mainWindows;
+}
+
+- (void)awakeFromNib
+{
+	[super awakeFromNib];
+
+	_bridge = [[RCTBridge alloc] initWithDelegate:self
+																	launchOptions:nil];
+}
+
+- (void)applicationWillFinishLaunching:(NSNotification *)__unused aNotification
+{
+  [NSUserNotificationCenter defaultUserNotificationCenter].delegate = self;
+  
+	// initialize the url event listeners for Linking module
+	// note that you will need to add a URL type to your app’s info.plist
+	// this sample registers the rntester scheme
+	[[NSAppleEventManager sharedAppleEventManager] setEventHandler:[RCTLinkingManager class]
+                                                     andSelector:@selector(getUrlEventHandler:withReplyEvent:)
+                                                   forEventClass:kInternetEventClass
+                                                      andEventID:kAEGetURL];
+
+}
+
+-(IBAction)newDocument:(id)__unused sender
+{
+  if (_mainWindows == nil) {
+    _mainWindows = [NSMutableArray new];
+  }
+  
+  NSWindowController *windowController = [[NSStoryboard storyboardWithName:@"Main" bundle:nil] instantiateControllerWithIdentifier:@"MainWindow"];
+  [_mainWindows addObject:windowController];
+  [windowController showWindow:self];
+}
+
+#pragma mark - RCTBridgeDelegate Methods
+
+- (NSURL *)sourceURLForBridge:(__unused RCTBridge *)bridge
+{
+	NSString *jsBundlePath = [NSString stringWithFormat:@"RNTester/js/%@.macos",kBundleNameJS];
+  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:jsBundlePath
+                                                        fallbackResource:nil];
+}
+
+# pragma mark - Push Notifications
+
+// Required for the remoteNotificationsRegistered event.
+- (void)application:(NSApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
+{
+  [RCTPushNotificationManager didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
+}
+
+// Required for the remoteNotificationRegistrationError event.
+- (void)application:(NSApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
+{
+  [RCTPushNotificationManager didFailToRegisterForRemoteNotificationsWithError:error];
+}
+
+// Required for the remoteNotificationReceived event.
+- (void)application:(NSApplication *)application didReceiveRemoteNotification:(NSDictionary<NSString *,id> *)userInfo
+{
+  [RCTPushNotificationManager didReceiveRemoteNotification:userInfo];
+}
+
+- (void)userNotificationCenter:(NSUserNotificationCenter *)center didDeliverNotification:(NSUserNotification *)notification
+{
+  
+}
+
+- (void)userNotificationCenter:(NSUserNotificationCenter *)center didActivateNotification:(NSUserNotification *)notification
+{
+  [RCTPushNotificationManager didReceiveUserNotification:notification];
+}
+
+- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center shouldPresentNotification:(NSUserNotification *)notification
+{
+  return YES;
+}
+
+@end
