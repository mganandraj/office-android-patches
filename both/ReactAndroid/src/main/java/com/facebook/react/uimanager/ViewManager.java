diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/uimanager/ViewManager.java b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/uimanager/ViewManager.java
index dd46f6791..7100f699c 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/uimanager/ViewManager.java
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/uimanager/ViewManager.java
@@ -43,7 +43,6 @@ public abstract class ViewManager<T extends View, C extends ReactShadowNode>
    * @param props
    */
   public void updateProperties(@Nonnull T viewToUpdate, ReactStylesDiffMap props) {
-
     ViewManagerPropertyUpdater.updateProps(this, viewToUpdate, props);
     onAfterUpdateTransaction(viewToUpdate);
   }
