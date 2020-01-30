diff --git a/E:/github/ms-react-native-forpatch/Libraries/Utilities/BackHandler.ios.js b/E:/github/fb-react-native-forpatch/Libraries/Utilities/BackHandler.ios.js
index c5f5f92d3..88093a73e 100644
--- a/E:/github/ms-react-native-forpatch/Libraries/Utilities/BackHandler.ios.js
+++ b/E:/github/fb-react-native-forpatch/Libraries/Utilities/BackHandler.ios.js
@@ -32,8 +32,6 @@ function emptyFunction(): void {}
  *
  * iOS: Not applicable.
  *
- * macOS: Not applicable.
- *
  * The event subscriptions are called in reverse order (i.e. last registered subscription first),
  * and if one subscription returns true then subscriptions registered earlier will not be called.
  *
