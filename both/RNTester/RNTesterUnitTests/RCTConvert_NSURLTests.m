diff --git a/E:/github/ms-react-native-forpatch/RNTester/RNTesterUnitTests/RCTConvert_NSURLTests.m b/E:/github/fb-react-native-forpatch/RNTester/RNTesterUnitTests/RCTConvert_NSURLTests.m
index fb944003c..cdf4bfec8 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/RNTesterUnitTests/RCTConvert_NSURLTests.m
+++ b/E:/github/fb-react-native-forpatch/RNTester/RNTesterUnitTests/RCTConvert_NSURLTests.m
@@ -30,7 +30,7 @@
 } \
 
 #define TEST_BUNDLE_PATH(name, _input, _expectedPath) \
-TEST_PATH(name, _input, [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:_expectedPath])
+TEST_PATH(name, _input, [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:_expectedPath])
 
 // Basic tests
 TEST_URL(basic, @"http://example.com", @"http://example.com")
