--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTConvert_NSURLTests.m"	2020-01-30 13:55:48.060609000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTConvert_NSURLTests.m"	2020-01-29 14:10:09.106911500 -0800
@@ -30,7 +30,7 @@
 } \
 
 #define TEST_BUNDLE_PATH(name, _input, _expectedPath) \
-TEST_PATH(name, _input, [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:_expectedPath])
+TEST_PATH(name, _input, [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:_expectedPath])
 
 // Basic tests
 TEST_URL(basic, @"http://example.com", @"http://example.com")
