diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/views/scroll/ReactScrollView.java b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/views/scroll/ReactScrollView.java
index de0fc82ee..e98c1864c 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/views/scroll/ReactScrollView.java
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/views/scroll/ReactScrollView.java
@@ -205,35 +205,6 @@ public class ReactScrollView extends ScrollView implements ReactClippingViewGrou
     }
   }
 
-  /**
-   * Since ReactScrollView handles layout changes on JS side, it does not call super.onlayout
-   * due to which mIsLayoutDirty flag in ScrollView remains true and prevents scrolling to child
-   * when requestChildFocus is called.
-   * Overriding this method and scrolling to child without checking any layout dirty flag. This will fix
-   * focus navigation issue for KeyEvents which are not handled by ScrollView, for example: KEYCODE_TAB.
-   */
-  @Override
-  public void requestChildFocus(View child, View focused) {
-    if (focused != null) {
-      scrollToChild(focused);
-    }
-    super.requestChildFocus(child, focused);
-  }
-
-  private void scrollToChild(View child) {
-    Rect tempRect = new Rect();
-    child.getDrawingRect(tempRect);
-
-    /* Offset from child's local coordinates to ScrollView coordinates */
-    offsetDescendantRectToMyCoords(child, tempRect);
-
-    int scrollDelta = computeScrollDeltaToGetChildRectOnScreen(tempRect);
-
-    if (scrollDelta != 0) {
-      scrollBy(0, scrollDelta);
-    }
-  }
-
   @Override
   protected void onScrollChanged(int x, int y, int oldX, int oldY) {
     super.onScrollChanged(x, y, oldX, oldY);
