diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Utilities\\BackHandler.android.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Utilities\\BackHandler.android.js"
index a7e2e29..be48d8b 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Utilities\\BackHandler.android.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Utilities\\BackHandler.android.js"
@@ -42,6 +42,8 @@ RCTDeviceEventEmitter.addListener(DEVICE_BACK_EVENT, function() {
  *
  * iOS: Not applicable.
  *
+ * macOS: Not applicable.
+ *
  * The event subscriptions are called in reverse order (i.e. last registered subscription first),
  * and if one subscription returns true then subscriptions registered earlier will not be called.
  *
