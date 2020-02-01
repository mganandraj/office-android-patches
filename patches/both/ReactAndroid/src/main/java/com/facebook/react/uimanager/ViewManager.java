diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\ViewManager.java" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\ViewManager.java"
index 7100f69..dd46f67 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\ViewManager.java"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\ViewManager.java"
@@ -43,6 +43,7 @@ public abstract class ViewManager<T extends View, C extends ReactShadowNode>
    * @param props
    */
   public void updateProperties(@Nonnull T viewToUpdate, ReactStylesDiffMap props) {
+
     ViewManagerPropertyUpdater.updateProps(this, viewToUpdate, props);
     onAfterUpdateTransaction(viewToUpdate);
   }
