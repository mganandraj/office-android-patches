diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/uimanager/UIImplementation.java b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/uimanager/UIImplementation.java
index 6928631f2..dfa310b76 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/uimanager/UIImplementation.java
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/uimanager/UIImplementation.java
@@ -771,14 +771,6 @@ public class UIImplementation {
     mOperationsQueue.enqueueSendAccessibilityEvent(tag, eventType);
   }
 
-   public void performAccessibilityAction(int tag, int action) {
-    mOperationsQueue.enqueuePerformAccessibilityAction(tag, action);
-  }
-
-  public void announceForAccessibility(int tag, String announcement) {
-    mOperationsQueue.enqueueAnnounceForAccessibility(tag, announcement);
-  }
-
   public void onHostResume() {
     mOperationsQueue.resumeFrameCallback();
   }
