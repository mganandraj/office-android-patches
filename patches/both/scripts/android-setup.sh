diff --git "a/E:\\github\\fb-react-native-forpatch-base\\scripts\\android-setup.sh" "b/E:\\github\\ms-react-native-forpatch\\scripts\\android-setup.sh"
index c76f520..ee8ed15 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\scripts\\android-setup.sh"
+++ "b/E:\\github\\ms-react-native-forpatch\\scripts\\android-setup.sh"
@@ -16,19 +16,23 @@ function getAndroidPackages {
 
   # Package names can be obtained using `sdkmanager --list`
   if [ ! -e "$DEPS" ] || [ ! "$CI" ]; then
+    echo "Applying circleci Android SDX Licence signing workaround..."
+    yes | sdkmanager --licenses || echo ""
+    echo "Applying circleci Android SDX Licence signing workaround...2"
+    yes | sdkmanager --update || echo ""
     echo "Installing Android API level $ANDROID_SDK_TARGET_API_LEVEL, Google APIs, $AVD_ABI system image..."
-    sdkmanager "system-images;android-$ANDROID_SDK_TARGET_API_LEVEL;google_apis;$AVD_ABI"
+    echo y | sdkmanager "system-images;android-$ANDROID_SDK_TARGET_API_LEVEL;google_apis;$AVD_ABI"
     echo "Installing build SDK for Android API level $ANDROID_SDK_BUILD_API_LEVEL..."
-    sdkmanager "platforms;android-$ANDROID_SDK_BUILD_API_LEVEL"
+    echo y | sdkmanager "platforms;android-$ANDROID_SDK_BUILD_API_LEVEL"
     echo "Installing target SDK for Android API level $ANDROID_SDK_TARGET_API_LEVEL..."
-    sdkmanager "platforms;android-$ANDROID_SDK_TARGET_API_LEVEL"
+    echo y | sdkmanager "platforms;android-$ANDROID_SDK_TARGET_API_LEVEL"
     echo "Installing SDK build tools, revision $ANDROID_SDK_BUILD_TOOLS_REVISION..."
-    sdkmanager "build-tools;$ANDROID_SDK_BUILD_TOOLS_REVISION"
+    echo y | sdkmanager "build-tools;$ANDROID_SDK_BUILD_TOOLS_REVISION"
     # These moved to "system-images;android-$ANDROID_SDK_BUILD_API_LEVEL;google_apis;x86" starting with API level 25, but there is no ARM version.
     echo "Installing Google APIs $ANDROID_GOOGLE_API_LEVEL..."
-    sdkmanager "add-ons;addon-google_apis-google-$ANDROID_GOOGLE_API_LEVEL"
+    echo y | sdkmanager "add-ons;addon-google_apis-google-$ANDROID_GOOGLE_API_LEVEL"
     echo "Installing Android Support Repository"
-    sdkmanager "extras;android;m2repository"
+    echo y | sdkmanager "extras;android;m2repository"
     $CI && touch "$DEPS"
   fi
 }
