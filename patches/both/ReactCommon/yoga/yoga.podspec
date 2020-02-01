diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\yoga\\yoga.podspec" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\yoga\\yoga.podspec"
index fd17f01..01d86b2 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\yoga\\yoga.podspec"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\yoga\\yoga.podspec"
@@ -39,7 +39,7 @@ Pod::Spec.new do |spec|
   ]
 
   # Pinning to the same version as React.podspec.
-  spec.platforms = { :ios => "9.0", :tvos => "9.2" }
+  spec.platforms = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
 
   # Set this environment variable when *not* using the `:path` option to install the pod.
   # E.g. when publishing this spec to a spec repo.
