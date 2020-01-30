diff --git a/E:/github/ms-react-native-forpatch/Libraries/Utilities/BackHandler.android.js b/E:/github/fb-react-native-forpatch/Libraries/Utilities/BackHandler.android.js
index be48d8b81..a7e2e29dc 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Utilities/BackHandler.android.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Utilities/BackHandler.android.js
@@ -42,8 +42,6 @@ RCTDeviceEventEmitter.addListener(DEVICE_BACK_EVENT, function() {
  *
  * iOS: Not applicable.
  *
- * macOS: Not applicable.
- *
  * The event subscriptions are called in reverse order (i.e. last registered subscription first),
  * and if one subscription returns true then subscriptions registered earlier will not be called.
  *
