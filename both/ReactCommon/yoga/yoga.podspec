diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/yoga/yoga.podspec b/E:/github/fb-react-native-forpatch/ReactCommon/yoga/yoga.podspec
index 01d86b283..fd17f019c 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/yoga/yoga.podspec
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/yoga/yoga.podspec
@@ -39,7 +39,7 @@ Pod::Spec.new do |spec|
   ]
 
   # Pinning to the same version as React.podspec.
-  spec.platforms = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
+  spec.platforms = { :ios => "9.0", :tvos => "9.2" }
 
   # Set this environment variable when *not* using the `:path` option to install the pod.
   # E.g. when publishing this spec to a spec repo.
