--- "e:\\github\\fb-react-native-forpatch-base\\ReactCommon\\yoga\\yoga.podspec"	2020-01-30 13:55:48.625582500 -0800
+++ "e:\\github\\ms-react-native-forpatch\\ReactCommon\\yoga\\yoga.podspec"	2020-01-29 14:10:09.842926300 -0800
@@ -39,7 +39,7 @@
   ]
 
   # Pinning to the same version as React.podspec.
-  spec.platforms = { :ios => "9.0", :tvos => "9.2" }
+  spec.platforms = { :ios => "9.0", :tvos => "9.2", :osx => "10.14" } # TODO(macOS GH#214)
 
   # Set this environment variable when *not* using the `:path` option to install the pod.
   # E.g. when publishing this spec to a spec repo.
