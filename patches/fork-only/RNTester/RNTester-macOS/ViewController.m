--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTester-macOS\\ViewController.m"	1969-12-31 16:00:00.000000000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\RNTester-macOS\\ViewController.m"	2020-01-29 14:10:09.051884200 -0800
@@ -0,0 +1,31 @@
+//
+//  ViewController.m
+//  RNTester-macOS
+//
+//  Created by Jeff Cruikshank on 6/5/17.
+//  Copyright © 2017 Facebook. All rights reserved.
+//
+
+#import "AppDelegate.h"
+#import "ViewController.h"
+
+#import <React/RCTRootView.h>
+
+@implementation ViewController
+
+- (void)viewDidLoad
+{
+  [super viewDidLoad];
+  
+  RCTBridge *bridge = ((AppDelegate *)[NSApp delegate]).bridge;
+  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
+                                                   moduleName:kBundleNameJS
+                                            initialProperties:nil];
+  
+  [self.view addSubview:rootView];
+  rootView.backgroundColor = [NSColor windowBackgroundColor];
+  rootView.frame = self.view.bounds;
+  rootView.autoresizingMask = (NSViewMinXMargin | NSViewMinXMargin | NSViewMinYMargin | NSViewMaxYMargin | NSViewWidthSizable | NSViewHeightSizable);
+}
+
+@end
