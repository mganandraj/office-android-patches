diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTConvert_NSURLTests.m" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTConvert_NSURLTests.m"
index cdf4bfe..fb94400 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTConvert_NSURLTests.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTConvert_NSURLTests.m"
@@ -30,7 +30,7 @@
 } \
 
 #define TEST_BUNDLE_PATH(name, _input, _expectedPath) \
-TEST_PATH(name, _input, [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:_expectedPath])
+TEST_PATH(name, _input, [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:_expectedPath])
 
 // Basic tests
 TEST_URL(basic, @"http://example.com", @"http://example.com")
