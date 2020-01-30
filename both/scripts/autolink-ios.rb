diff --git a/E:/github/ms-react-native-forpatch/scripts/autolink-ios.rb b/E:/github/fb-react-native-forpatch/scripts/autolink-ios.rb
index e36ee791d..21dd1b927 100644
--- a/E:/github/ms-react-native-forpatch/scripts/autolink-ios.rb
+++ b/E:/github/fb-react-native-forpatch/scripts/autolink-ios.rb
@@ -42,9 +42,6 @@ def use_react_native! (options={})
   pod 'glog', :podspec => "#{prefix}/third-party-podspecs/glog.podspec"
   pod 'Folly', :podspec => "#{prefix}/third-party-podspecs/Folly.podspec"
 
-  # TODO(macOS GH#214)
-  pod 'boost-for-react-native', :podspec => "#{prefix}/third-party-podspecs/boost-for-react-native.podspec"
-
   if fabric_enabled
     pod 'React-Fabric', :path => "#{prefix}/ReactCommon"
     pod 'React-graphics', :path => "#{prefix}/ReactCommon/fabric/graphics"
