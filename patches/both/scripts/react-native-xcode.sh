diff --git "a/E:\\github\\fb-react-native-forpatch-base\\scripts\\react-native-xcode.sh" "b/E:\\github\\ms-react-native-forpatch\\scripts\\react-native-xcode.sh"
index 34b8d5e..67f0c07 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\scripts\\react-native-xcode.sh"
+++ "b/E:\\github\\ms-react-native-forpatch\\scripts\\react-native-xcode.sh"
@@ -13,7 +13,7 @@ set -x
 DEST=$CONFIGURATION_BUILD_DIR/$UNLOCALIZED_RESOURCES_FOLDER_PATH
 
 # Enables iOS devices to get the IP address of the machine running Metro Bundler
-if [[ "$CONFIGURATION" = *Debug* && ! "$PLATFORM_NAME" == *simulator ]]; then
+if [[ "$CONFIGURATION" = *Debug* && ! "$PLATFORM_NAME" == *simulator && ! "$PLATFORM_NAME" == macosx ]]; then
   IP=$(ipconfig getifaddr en0)
   if [ -z "$IP" ]; then
     IP=$(ifconfig | grep 'inet ' | grep -v ' 127.' | cut -d\   -f2  | awk 'NR==1{print $1}')
@@ -29,13 +29,11 @@ fi
 
 case "$CONFIGURATION" in
   *Debug*)
-    if [[ "$PLATFORM_NAME" == *simulator ]]; then
-      if [[ "$FORCE_BUNDLING" ]]; then
-        echo "FORCE_BUNDLING enabled; continuing to bundle."
-      else
-        echo "Skipping bundling in Debug for the Simulator (since the packager bundles for you). Use the FORCE_BUNDLING flag to change this behavior."
-        exit 0;
-      fi
+    # Speed up build times by skipping the creation of the offline package for debug
+    # builds on the simulator since the packager is supposed to be running anyways.
+    if [[ "$PLATFORM_NAME" == *simulator || "$PLATFORM_NAME" == macosx ]]; then
+      echo "Skipping bundling for Simulator or macOS platform"
+      exit 0;
     else
       echo "Bundling for physical device. Use the SKIP_BUNDLING flag to change this behavior."
     fi
@@ -111,10 +109,19 @@ fi
 
 BUNDLE_FILE="$DEST/main.jsbundle"
 
+case "$PLATFORM_NAME" in
+  "macosx")
+    BUNDLE_PLATFORM="macos"
+    ;;
+  *)
+    BUNDLE_PLATFORM="ios"
+    ;;
+esac
+
 "$NODE_BINARY" $NODE_ARGS "$CLI_PATH" $BUNDLE_COMMAND \
   $CONFIG_ARG \
   --entry-file "$ENTRY_FILE" \
-  --platform ios \
+  --platform "$BUNDLE_PLATFORM" \
   --dev $DEV \
   --reset-cache \
   --bundle-output "$BUNDLE_FILE" \
