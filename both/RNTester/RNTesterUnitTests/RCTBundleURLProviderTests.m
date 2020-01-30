diff --git a/E:/github/ms-react-native-forpatch/RNTester/RNTesterUnitTests/RCTBundleURLProviderTests.m b/E:/github/fb-react-native-forpatch/RNTester/RNTesterUnitTests/RCTBundleURLProviderTests.m
index 7fbea5cb9..b1f7c204c 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/RNTesterUnitTests/RCTBundleURLProviderTests.m
+++ b/E:/github/fb-react-native-forpatch/RNTester/RNTesterUnitTests/RCTBundleURLProviderTests.m
@@ -20,12 +20,12 @@ static NSURL *mainBundleURL()
 
 static NSURL *localhostBundleURL()
 {
-  return [NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:8081/%@.bundle?platform=%@&dev=true&minify=false", testFile, kRCTPlatformName]];
+  return [NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:8081/%@.bundle?platform=ios&dev=true&minify=false", testFile]];
 }
 
 static NSURL *ipBundleURL()
 {
-  return [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.1.1:8081/%@.bundle?platform=%@&dev=true&minify=false", testFile, kRCTPlatformName]];
+  return [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.1.1:8081/%@.bundle?platform=ios&dev=true&minify=false", testFile]];
 }
 
 @implementation NSBundle (RCTBundleURLProviderTests)
