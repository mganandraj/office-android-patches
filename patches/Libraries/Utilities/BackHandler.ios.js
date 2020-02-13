--- "e:\\github\\fb-react-native-forpatch-base\\Libraries\\Utilities\\BackHandler.ios.js"	2020-01-30 13:55:48.004610400 -0800
+++ "e:\\github\\ms-react-native-forpatch\\Libraries\\Utilities\\BackHandler.ios.js"	2020-01-29 14:10:09.007915000 -0800
@@ -32,6 +32,8 @@
  *
  * iOS: Not applicable.
  *
+ * macOS: Not applicable.
+ *
  * The event subscriptions are called in reverse order (i.e. last registered subscription first),
  * and if one subscription returns true then subscriptions registered earlier will not be called.
  *
