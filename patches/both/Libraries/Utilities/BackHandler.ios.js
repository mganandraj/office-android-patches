diff --git "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Utilities\\BackHandler.ios.js" "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Utilities\\BackHandler.ios.js"
index 88093a7..c5f5f92 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\Libraries\\Utilities\\BackHandler.ios.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\Libraries\\Utilities\\BackHandler.ios.js"
@@ -32,6 +32,8 @@ function emptyFunction(): void {}
  *
  * iOS: Not applicable.
  *
+ * macOS: Not applicable.
+ *
  * The event subscriptions are called in reverse order (i.e. last registered subscription first),
  * and if one subscription returns true then subscriptions registered earlier will not be called.
  *
