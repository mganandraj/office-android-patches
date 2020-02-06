--- "E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\ViewManager.java"	2020-01-30 13:55:48.378614200 -0800
+++ "E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\ViewManager.java"	2020-01-29 14:10:09.458921000 -0800
@@ -43,6 +43,7 @@
    * @param props
    */
   public void updateProperties(@Nonnull T viewToUpdate, ReactStylesDiffMap props) {
+
     ViewManagerPropertyUpdater.updateProps(this, viewToUpdate, props);
     onAfterUpdateTransaction(viewToUpdate);
   }
