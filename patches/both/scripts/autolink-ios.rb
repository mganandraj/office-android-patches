diff --git "a/E:\\github\\fb-react-native-forpatch-base\\scripts\\autolink-ios.rb" "b/E:\\github\\ms-react-native-forpatch\\scripts\\autolink-ios.rb"
index 21dd1b9..e36ee79 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\scripts\\autolink-ios.rb"
+++ "b/E:\\github\\ms-react-native-forpatch\\scripts\\autolink-ios.rb"
@@ -42,6 +42,9 @@ def use_react_native! (options={})
   pod 'glog', :podspec => "#{prefix}/third-party-podspecs/glog.podspec"
   pod 'Folly', :podspec => "#{prefix}/third-party-podspecs/Folly.podspec"
 
+  # TODO(macOS GH#214)
+  pod 'boost-for-react-native', :podspec => "#{prefix}/third-party-podspecs/boost-for-react-native.podspec"
+
   if fabric_enabled
     pod 'React-Fabric', :path => "#{prefix}/ReactCommon"
     pod 'React-graphics', :path => "#{prefix}/ReactCommon/fabric/graphics"
