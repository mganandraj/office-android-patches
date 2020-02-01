diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\WebSocket\\React-RCTWebSocket.podspec" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\WebSocket\\React-RCTWebSocket.podspec"
index a1abfd7..62525de 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\WebSocket\\React-RCTWebSocket.podspec"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\WebSocket\\React-RCTWebSocket.podspec"
@@ -25,7 +25,7 @@ Pod::Spec.new do |s|
   s.documentation_url      = "https://facebook.github.io/react-native/docs/network#websocket-support"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
+  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
   s.source                 = source
   s.source_files           = "*.{h,m}",
                              "Libraries/fishhook/*.{h,c}"
