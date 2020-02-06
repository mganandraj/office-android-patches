--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTJSONTests.m"	2020-01-30 13:55:48.063609000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTJSONTests.m"	2020-01-29 14:10:09.108883400 -0800
@@ -106,6 +106,7 @@
   XCTAssertEqualObjects(json, RCTJSONStringify(obj, NULL));
 }
 
+/* TODO(OSS Candidate ISS#2710739): crashes in XCode 11
 - (void)testNotUTF8Convertible
 {
   //see https://gist.github.com/0xced/56035d2f57254cf518b5
@@ -114,6 +115,7 @@
   NSString *json = @"{\"foo\":null}";
   XCTAssertEqualObjects(json, RCTJSONStringify(obj, NULL));
 }
+TODO(OSS Candidate ISS#2710739) */
 
 - (void)testErrorPointer
 {
