diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/uimanager/UIManagerModule.java b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/uimanager/UIManagerModule.java
index fe4f64d7d..60668e652 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/uimanager/UIManagerModule.java
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/uimanager/UIManagerModule.java
@@ -767,16 +767,6 @@ public class UIManagerModule extends ReactContextBaseJavaModule
     mUIImplementation.sendAccessibilityEvent(tag, eventType);
   }
 
-  @ReactMethod
-  public void performAccessibilityAction(int tag, int action) {
-    mUIImplementation.performAccessibilityAction(tag, action);
-  }
-
-  @ReactMethod
-  public void announceForAccessibility(int tag, String announcement) {
-    mUIImplementation.announceForAccessibility(tag, announcement);
-  }
-
   /**
    * Schedule a block to be executed on the UI thread. Useful if you need to execute view logic
    * after all currently queued view updates have completed.
