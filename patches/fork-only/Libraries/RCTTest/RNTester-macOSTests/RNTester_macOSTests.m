--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\RCTTest\\RNTester-macOSTests\\RNTester_macOSTests.m"	1969-12-31 16:00:00.000000000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\RCTTest\\RNTester-macOSTests\\RNTester_macOSTests.m"	2020-01-29 14:10:08.957882200 -0800
@@ -0,0 +1,39 @@
+//
+//  RNTester_macOSTests.m
+//  RNTester-macOSTests
+//
+//  Created by Tom Underhill on 6/16/17.
+//  Copyright © 2017 Facebook. All rights reserved.
+//
+
+#import <XCTest/XCTest.h>
+
+@interface RNTester_macOSTests : XCTestCase
+
+@end
+
+@implementation RNTester_macOSTests
+
+- (void)setUp {
+    [super setUp];
+    // Put setup code here. This method is called before the invocation of each test method in the class.
+}
+
+- (void)tearDown {
+    // Put teardown code here. This method is called after the invocation of each test method in the class.
+    [super tearDown];
+}
+
+- (void)testExample {
+    // This is an example of a functional test case.
+    // Use XCTAssert and related functions to verify your tests produce the correct results.
+}
+
+- (void)testPerformanceExample {
+    // This is an example of a performance test case.
+    [self measureBlock:^{
+        // Put the code you want to measure the time of here.
+    }];
+}
+
+@end
