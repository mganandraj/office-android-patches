diff --git a/E:/github/ms-react-native-forpatch/scripts/circleci/gradle_download_deps.sh b/E:/github/fb-react-native-forpatch/scripts/circleci/gradle_download_deps.sh
index e541863f5..dd3d781dc 100644
--- a/E:/github/ms-react-native-forpatch/scripts/circleci/gradle_download_deps.sh
+++ b/E:/github/fb-react-native-forpatch/scripts/circleci/gradle_download_deps.sh
@@ -6,8 +6,4 @@
 
 set -e
 
-<<<<<<< HEAD
-./gradlew :ReactAndroid:downloadBoost # :ReactAndroid:downloadDoubleConversion :ReactAndroid:downloadFolly :ReactAndroid:downloadGlog :ReactAndroid:downloadJSC
-=======
 ./gradlew :ReactAndroid:downloadBoost :ReactAndroid:downloadDoubleConversion :ReactAndroid:downloadFolly :ReactAndroid:downloadGlog
->>>>>>> v0.60.0
