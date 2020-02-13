--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\PushNotificationIOS\\React-RCTPushNotification.podspec"	2020-01-30 13:55:47.960608000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\PushNotificationIOS\\React-RCTPushNotification.podspec"	2020-01-29 14:10:08.954883900 -0800
@@ -25,7 +25,7 @@
   s.documentation_url      = "https://facebook.github.io/react-native/docs/pushnotificationios"
   s.license                = package["license"]
   s.author                 = "Facebook, Inc. and its affiliates"
-  s.platforms              = { :ios => "9.0", :tvos => "9.2" }
+  s.platforms              = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
   s.source                 = source
   s.source_files           = "*.{h,m}"
   s.preserve_paths         = "package.json", "LICENSE", "LICENSE-docs"
