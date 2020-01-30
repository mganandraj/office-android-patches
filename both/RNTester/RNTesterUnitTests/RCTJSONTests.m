diff --git a/E:/github/ms-react-native-forpatch/RNTester/RNTesterUnitTests/RCTJSONTests.m b/E:/github/fb-react-native-forpatch/RNTester/RNTesterUnitTests/RCTJSONTests.m
index 2ef8a8f97..3dcf15e2f 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/RNTesterUnitTests/RCTJSONTests.m
+++ b/E:/github/fb-react-native-forpatch/RNTester/RNTesterUnitTests/RCTJSONTests.m
@@ -106,7 +106,6 @@
   XCTAssertEqualObjects(json, RCTJSONStringify(obj, NULL));
 }
 
-/* TODO(OSS Candidate ISS#2710739): crashes in XCode 11
 - (void)testNotUTF8Convertible
 {
   //see https://gist.github.com/0xced/56035d2f57254cf518b5
@@ -115,7 +114,6 @@
   NSString *json = @"{\"foo\":null}";
   XCTAssertEqualObjects(json, RCTJSONStringify(obj, NULL));
 }
-TODO(OSS Candidate ISS#2710739) */
 
 - (void)testErrorPointer
 {
