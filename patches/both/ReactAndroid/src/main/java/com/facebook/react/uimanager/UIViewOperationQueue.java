diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\UIViewOperationQueue.java" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\UIViewOperationQueue.java"
index cf66d2a..aae9388 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\UIViewOperationQueue.java"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\UIViewOperationQueue.java"
@@ -546,6 +546,36 @@ public class UIViewOperationQueue {
     }
   }
 
+  private final class PerformAccessibilityAction extends ViewOperation {
+
+    private final int mAction;
+
+    private PerformAccessibilityAction(int tag, int action) {
+      super(tag);
+      mAction = action;
+    }
+
+    @Override
+    public void execute() {
+      mNativeViewHierarchyManager.performAccessibilityAction(mTag, mAction);
+    }
+  }
+ 
+   private final class AnnounceForAccessibility extends ViewOperation {
+
+    private final String mAnnouncement;
+
+    private AnnounceForAccessibility(int tag, String announcement) {
+      super(tag);
+      mAnnouncement = announcement;
+    }
+
+    @Override
+    public void execute() {
+      mNativeViewHierarchyManager.announceForAccessibility(mTag, mAnnouncement);
+    }
+  }
+
   private final NativeViewHierarchyManager mNativeViewHierarchyManager;
   private final Object mDispatchRunnablesLock = new Object();
   private final Object mNonBatchedOperationsLock = new Object();
@@ -774,6 +804,14 @@ public class UIViewOperationQueue {
     mOperations.add(new SendAccessibilityEvent(tag, eventType));
   }
 
+  public void enqueuePerformAccessibilityAction(int tag, int action) {
+    mOperations.add(new PerformAccessibilityAction(tag, action));
+  }
+
+  public void enqueueAnnounceForAccessibility(int tag, String announcement) {
+    mOperations.add(new AnnounceForAccessibility(tag, announcement));
+  }
+
   public void enqueueLayoutUpdateFinished(ReactShadowNode node, UIImplementation.LayoutUpdateListener listener) {
     mOperations.add(new LayoutUpdateFinishedOperation(node, listener));
   }
