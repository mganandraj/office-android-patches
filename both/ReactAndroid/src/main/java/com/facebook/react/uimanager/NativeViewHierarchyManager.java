diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/uimanager/NativeViewHierarchyManager.java b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/uimanager/NativeViewHierarchyManager.java
index 62ced3a2e..724dd8e81 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/uimanager/NativeViewHierarchyManager.java
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/uimanager/NativeViewHierarchyManager.java
@@ -860,34 +860,4 @@ public class NativeViewHierarchyManager {
     }
     view.sendAccessibilityEvent(eventType);
   }
-
-  public void performAccessibilityAction(int tag, final int action) {
-    View view = mTagsToViews.get(tag);
-    if (view == null) {
-      throw new JSApplicationIllegalArgumentException("Could not find view with tag " + tag);
-    }
-    view.post(
-      new Runnable() {
-        @Override
-        public void run() {
-          view.performAccessibilityAction(action, null);
-        }
-      }
-    );
-  }
-
-  public void announceForAccessibility(int tag, final String announcement) {
-    View view = mTagsToViews.get(tag);
-    if (view == null) {
-      throw new JSApplicationIllegalArgumentException("Could not find view with tag " + tag);
-    }
-    view.post(
-      new Runnable() {
-        @Override
-        public void run() {
-          view.announceForAccessibility(announcement);
-        }
-      }
-    );
-  }
 }
