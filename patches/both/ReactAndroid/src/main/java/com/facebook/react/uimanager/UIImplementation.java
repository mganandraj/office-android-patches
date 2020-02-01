diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\UIImplementation.java" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\UIImplementation.java"
index dfa310b..6928631 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\UIImplementation.java"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\UIImplementation.java"
@@ -771,6 +771,14 @@ public class UIImplementation {
     mOperationsQueue.enqueueSendAccessibilityEvent(tag, eventType);
   }
 
+   public void performAccessibilityAction(int tag, int action) {
+    mOperationsQueue.enqueuePerformAccessibilityAction(tag, action);
+  }
+
+  public void announceForAccessibility(int tag, String announcement) {
+    mOperationsQueue.enqueueAnnounceForAccessibility(tag, announcement);
+  }
+
   public void onHostResume() {
     mOperationsQueue.resumeFrameCallback();
   }
