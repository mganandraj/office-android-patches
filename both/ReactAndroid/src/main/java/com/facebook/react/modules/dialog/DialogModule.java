diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/modules/dialog/DialogModule.java b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/modules/dialog/DialogModule.java
index 7ffa23e9e..2f7cfc487 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/modules/dialog/DialogModule.java
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/modules/dialog/DialogModule.java
@@ -13,6 +13,7 @@ import android.content.DialogInterface.OnClickListener;
 import android.content.DialogInterface.OnDismissListener;
 import android.os.Bundle;
 import androidx.fragment.app.FragmentActivity;
+import androidx.fragment.app.FragmentManager;
 
 import com.facebook.common.logging.FLog;
 import com.facebook.react.bridge.Callback;
@@ -67,31 +68,13 @@ public class DialogModule extends ReactContextBaseJavaModule implements Lifecycl
     return NAME;
   }
 
-  /**
-   * Helper to allow this module to work with both the standard FragmentManager
-   * and the Support/AndroidX FragmentManager (for apps that need to use the former for legacy reasons).
-   * Since the two APIs don't share a common interface there's unfortunately some
-   * code duplication.
-   * Please not that the direct usage of standard FragmentManager is deprecated in API v28
-   */
   private class FragmentManagerHelper {
-    private final @Nonnull androidx.fragment.app.FragmentManager mFragmentManager;
-    private final @Nullable android.app.FragmentManager mPlatformFragmentManager;
+    private final @Nonnull FragmentManager mFragmentManager;
 
     private @Nullable Object mFragmentToShow;
 
-    private boolean isUsingPlatformFragmentManager() {
-      return mPlatformFragmentManager != null;
-    }
-
-    public FragmentManagerHelper(android.app.FragmentManager platformFragmentManager) {
-      mFragmentManager = null;
-      mPlatformFragmentManager = platformFragmentManager;
-    }
-
-    public FragmentManagerHelper(@Nonnull androidx.fragment.app.FragmentManager fragmentManager) {
+    public FragmentManagerHelper(@Nonnull FragmentManager fragmentManager) {
       mFragmentManager = fragmentManager;
-      mPlatformFragmentManager = null;
     }
 
     public void showPendingAlert() {
@@ -102,11 +85,7 @@ public class DialogModule extends ReactContextBaseJavaModule implements Lifecycl
       }
 
       dismissExisting();
-      if(isUsingPlatformFragmentManager()) {
-        ((PlatformAlertFragment) mFragmentToShow).show(mPlatformFragmentManager, FRAGMENT_TAG);
-      } else {
-        ((AlertFragment) mFragmentToShow).show(mFragmentManager, FRAGMENT_TAG);
-      }
+      ((AlertFragment) mFragmentToShow).show(mFragmentManager, FRAGMENT_TAG);
       mFragmentToShow = null;
     }
 
@@ -114,19 +93,10 @@ public class DialogModule extends ReactContextBaseJavaModule implements Lifecycl
       if (!mIsInForeground) {
         return;
       }
-
-      if(isUsingPlatformFragmentManager()) {
-        PlatformAlertFragment oldFragment =
-          (PlatformAlertFragment) mPlatformFragmentManager.findFragmentByTag(FRAGMENT_TAG);
-        if (oldFragment != null && oldFragment.isResumed()) {
-          oldFragment.dismiss();
-        }
-      } else {
-        AlertFragment oldFragment =
-          (AlertFragment) mFragmentManager.findFragmentByTag(FRAGMENT_TAG);
-        if (oldFragment != null && oldFragment.isResumed()) {
-          oldFragment.dismiss();
-        }
+      AlertFragment oldFragment =
+        (AlertFragment) mFragmentManager.findFragmentByTag(FRAGMENT_TAG);
+      if (oldFragment != null && oldFragment.isResumed()) {
+        oldFragment.dismiss();
       }
     }
 
@@ -138,26 +108,14 @@ public class DialogModule extends ReactContextBaseJavaModule implements Lifecycl
       AlertFragmentListener actionListener =
           actionCallback != null ? new AlertFragmentListener(actionCallback) : null;
 
-      if(isUsingPlatformFragmentManager()) {
-        PlatformAlertFragment PlatformAlertFragment = new PlatformAlertFragment(actionListener, arguments);
-        if (mIsInForeground && !mPlatformFragmentManager.isStateSaved()) {
-          if (arguments.containsKey(KEY_CANCELABLE)) {
-            PlatformAlertFragment.setCancelable(arguments.getBoolean(KEY_CANCELABLE));
-          }
-          PlatformAlertFragment.show(mPlatformFragmentManager, FRAGMENT_TAG);
-        } else {
-          mFragmentToShow = PlatformAlertFragment;
+      AlertFragment alertFragment = new AlertFragment(actionListener, arguments);
+      if (mIsInForeground && !mFragmentManager.isStateSaved()) {
+        if (arguments.containsKey(KEY_CANCELABLE)) {
+          alertFragment.setCancelable(arguments.getBoolean(KEY_CANCELABLE));
         }
+        alertFragment.show(mFragmentManager, FRAGMENT_TAG);
       } else {
-        AlertFragment alertFragment = new AlertFragment(actionListener, arguments);
-        if (mIsInForeground && !mFragmentManager.isStateSaved()) {
-          if (arguments.containsKey(KEY_CANCELABLE)) {
-            alertFragment.setCancelable(arguments.getBoolean(KEY_CANCELABLE));
-          }
-          alertFragment.show(mFragmentManager, FRAGMENT_TAG);
-        } else {
-          mFragmentToShow = alertFragment;
-        }
+        mFragmentToShow = alertFragment;
       }
     }
   }
@@ -284,13 +242,6 @@ public class DialogModule extends ReactContextBaseJavaModule implements Lifecycl
     if (activity == null) {
       return null;
     }
-
-    if(activity instanceof FragmentActivity) {
-      return new FragmentManagerHelper(((FragmentActivity) activity).getSupportFragmentManager());
-    } else if(activity.getFragmentManager() != null){
-      return new FragmentManagerHelper(activity.getFragmentManager());
-    } else {
-      return null;
-    }
+    return new FragmentManagerHelper(((FragmentActivity) activity).getSupportFragmentManager());
   }
 }
