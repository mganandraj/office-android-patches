diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/views/scroll/ReactScrollViewManager.java b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/views/scroll/ReactScrollViewManager.java
index fecbd151d..afe0725e4 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/views/scroll/ReactScrollViewManager.java
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/views/scroll/ReactScrollViewManager.java
@@ -70,10 +70,6 @@ public class ReactScrollViewManager
   @ReactProp(name = "scrollEnabled", defaultBoolean = true)
   public void setScrollEnabled(ReactScrollView view, boolean value) {
     view.setScrollEnabled(value);
-
-    // Set focusable to match whether scroll is enabled. This improves keyboarding
-    // experience by not making scrollview a tab stop when you cannot interact with it.
-    view.setFocusable(value);
   }
 
   @ReactProp(name = "showsVerticalScrollIndicator")
