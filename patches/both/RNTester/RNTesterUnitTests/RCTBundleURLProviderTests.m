diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTBundleURLProviderTests.m" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTBundleURLProviderTests.m"
index b1f7c20..7fbea5c 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\RNTesterUnitTests\\RCTBundleURLProviderTests.m"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\RNTesterUnitTests\\RCTBundleURLProviderTests.m"
@@ -20,12 +20,12 @@ static NSURL *mainBundleURL()
 
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
