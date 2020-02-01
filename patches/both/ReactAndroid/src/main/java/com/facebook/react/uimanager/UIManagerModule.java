diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\UIManagerModule.java" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\UIManagerModule.java"
index 60668e6..fe4f64d 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\UIManagerModule.java"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\UIManagerModule.java"
@@ -767,6 +767,16 @@ public class UIManagerModule extends ReactContextBaseJavaModule
     mUIImplementation.sendAccessibilityEvent(tag, eventType);
   }
 
+  @ReactMethod
+  public void performAccessibilityAction(int tag, int action) {
+    mUIImplementation.performAccessibilityAction(tag, action);
+  }
+
+  @ReactMethod
+  public void announceForAccessibility(int tag, String announcement) {
+    mUIImplementation.announceForAccessibility(tag, announcement);
+  }
+
   /**
    * Schedule a block to be executed on the UI thread. Useful if you need to execute view logic
    * after all currently queued view updates have completed.
