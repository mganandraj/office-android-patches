--- "E:\\github\\fb-react-native-forpatch-base\\scripts\\circleci\\gradle_download_deps.sh"	2020-01-29 14:11:26.771530800 -0800
+++ "E:\\github\\ms-react-native-forpatch\\scripts\\circleci\\gradle_download_deps.sh"	2020-01-29 14:10:10.017894800 -0800
@@ -6,4 +6,8 @@
 
 set -e
 
+<<<<<<< HEAD
+./gradlew :ReactAndroid:downloadBoost # :ReactAndroid:downloadDoubleConversion :ReactAndroid:downloadFolly :ReactAndroid:downloadGlog :ReactAndroid:downloadJSC
+=======
 ./gradlew :ReactAndroid:downloadBoost :ReactAndroid:downloadDoubleConversion :ReactAndroid:downloadFolly :ReactAndroid:downloadGlog
+>>>>>>> v0.60.0
