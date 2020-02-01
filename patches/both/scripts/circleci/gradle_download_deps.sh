diff --git "a/E:\\github\\fb-react-native-forpatch-base\\scripts\\circleci\\gradle_download_deps.sh" "b/E:\\github\\ms-react-native-forpatch\\scripts\\circleci\\gradle_download_deps.sh"
index dd3d781..e541863 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\scripts\\circleci\\gradle_download_deps.sh"
+++ "b/E:\\github\\ms-react-native-forpatch\\scripts\\circleci\\gradle_download_deps.sh"
@@ -6,4 +6,8 @@
 
 set -e
 
+<<<<<<< HEAD
+./gradlew :ReactAndroid:downloadBoost # :ReactAndroid:downloadDoubleConversion :ReactAndroid:downloadFolly :ReactAndroid:downloadGlog :ReactAndroid:downloadJSC
+=======
 ./gradlew :ReactAndroid:downloadBoost :ReactAndroid:downloadDoubleConversion :ReactAndroid:downloadFolly :ReactAndroid:downloadGlog
+>>>>>>> v0.60.0
