--- "E:\\github\\fb-react-native-forpatch-base\\Libraries\\WebSocket\\React-RCTWebSocket.podspec"	2020-01-30 13:55:48.018611600 -0800
+++ "E:\\github\\ms-react-native-forpatch\\Libraries\\WebSocket\\React-RCTWebSocket.podspec"	2020-01-29 14:10:09.024884000 -0800
@@ -25,7 +25,7 @@
   s.documentation_url      = "https://facebook.github.io/react-native/docs/network#websocket-support"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
+  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
   s.source                 = source
   s.source_files           = "*.{h,m}",
                              "Libraries/fishhook/*.{h,c}"
