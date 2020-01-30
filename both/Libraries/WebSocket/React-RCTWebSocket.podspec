diff --git a/E:/github/ms-react-native-forpatch/Libraries/WebSocket/React-RCTWebSocket.podspec b/E:/github/fb-react-native-forpatch/Libraries/WebSocket/React-RCTWebSocket.podspec
index 62525de4d..a1abfd7f1 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/WebSocket/React-RCTWebSocket.podspec
+++ b/E:/github/fb-react-native-forpatch/Libraries/WebSocket/React-RCTWebSocket.podspec
@@ -25,7 +25,7 @@ Pod::Spec.new do |s|
   s.documentation_url      = "https://facebook.github.io/react-native/docs/network#websocket-support"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
+  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
   s.source                 = source
   s.source_files           = "*.{h,m}",
                              "Libraries/fishhook/*.{h,c}"
