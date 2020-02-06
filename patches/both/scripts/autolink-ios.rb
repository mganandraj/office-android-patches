--- "E:\\github\\fb-react-native-forpatch-base\\scripts\\autolink-ios.rb"	2020-01-30 13:55:48.658610200 -0800
+++ "E:\\github\\ms-react-native-forpatch\\scripts\\autolink-ios.rb"	2020-01-29 14:10:10.015894300 -0800
@@ -42,6 +42,9 @@
   pod 'glog', :podspec => "#{prefix}/third-party-podspecs/glog.podspec"
   pod 'Folly', :podspec => "#{prefix}/third-party-podspecs/Folly.podspec"
 
+  # TODO(macOS GH#214)
+  pod 'boost-for-react-native', :podspec => "#{prefix}/third-party-podspecs/boost-for-react-native.podspec"
+
   if fabric_enabled
     pod 'React-Fabric', :path => "#{prefix}/ReactCommon"
     pod 'React-graphics', :path => "#{prefix}/ReactCommon/fabric/graphics"
