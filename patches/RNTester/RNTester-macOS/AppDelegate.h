--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTester-macOS\\AppDelegate.h"	1969-12-31 16:00:00.000000000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\RNTester-macOS\\AppDelegate.h"	2020-01-29 14:10:09.049883100 -0800
@@ -0,0 +1,19 @@
+//
+//  AppDelegate.h
+//  RNTester-macOS
+//
+//  Created by Jeff Cruikshank on 6/5/17.
+//  Copyright © 2017 Facebook. All rights reserved.
+//
+
+#import <Cocoa/Cocoa.h>
+
+@class RCTBridge;
+extern NSString *kBundleNameJS;
+
+@interface AppDelegate : NSObject <NSApplicationDelegate>
+
+@property (nonatomic, readonly) RCTBridge *bridge;
+
+@end
+
