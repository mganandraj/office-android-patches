diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTJSONTests.m" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTJSONTests.m"
index 3dcf15e..2ef8a8f 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTJSONTests.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTJSONTests.m"
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
