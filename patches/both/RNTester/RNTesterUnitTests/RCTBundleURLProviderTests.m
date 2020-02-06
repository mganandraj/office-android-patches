--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTBundleURLProviderTests.m"	2020-01-30 13:55:48.059611400 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTBundleURLProviderTests.m"	2020-01-29 14:10:09.105909500 -0800
@@ -20,12 +20,12 @@
 
 static NSURL *localhostBundleURL()
 {
-  return [NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:8081/%@.bundle?platform=ios&dev=true&minify=false", testFile]];
+  return [NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:8081/%@.bundle?platform=%@&dev=true&minify=false", testFile, kRCTPlatformName]];
 }
 
 static NSURL *ipBundleURL()
 {
-  return [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.1.1:8081/%@.bundle?platform=ios&dev=true&minify=false", testFile]];
+  return [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.1.1:8081/%@.bundle?platform=%@&dev=true&minify=false", testFile, kRCTPlatformName]];
 }
 
 @implementation NSBundle (RCTBundleURLProviderTests)
