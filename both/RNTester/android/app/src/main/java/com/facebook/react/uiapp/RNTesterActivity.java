diff --git a/E:/github/ms-react-native-forpatch/RNTester/android/app/src/main/java/com/facebook/react/uiapp/RNTesterActivity.java b/E:/github/fb-react-native-forpatch/RNTester/android/app/src/main/java/com/facebook/react/uiapp/RNTesterActivity.java
index 2c96cf086..8a9053522 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/android/app/src/main/java/com/facebook/react/uiapp/RNTesterActivity.java
+++ b/E:/github/fb-react-native-forpatch/RNTester/android/app/src/main/java/com/facebook/react/uiapp/RNTesterActivity.java
@@ -9,23 +9,14 @@
 package com.facebook.react.uiapp;
 
 import android.os.Bundle;
-import android.system.ErrnoException;
-import android.system.Os;
-import android.util.Log;
 
 import com.facebook.react.ReactActivity;
 import com.facebook.react.ReactActivityDelegate;
-import com.facebook.react.ReactInstanceManager;
-import com.facebook.react.bridge.CatalystInstance;
-import com.facebook.react.bridge.ReactContext;
-
-import java.io.File;
 
 import javax.annotation.Nullable;
 
 public class RNTesterActivity extends ReactActivity {
   public static class RNTesterActivityDelegate extends ReactActivityDelegate {
-    private static final String LOG_TAG = "RNTesterActivity";
     private static final String PARAM_ROUTE = "route";
     private Bundle mInitialProps = null;
     private final @Nullable ReactActivity mActivity;
@@ -47,9 +38,13 @@ public class RNTesterActivity extends ReactActivity {
         mInitialProps = new Bundle();
         mInitialProps.putString("exampleFromAppetizeParams", routeUri);
       }
-
       super.onCreate(savedInstanceState);
     }
+
+    @Override
+    protected Bundle getLaunchOptions() {
+      return mInitialProps;
+    }
   }
 
   @Override
@@ -61,4 +56,4 @@ public class RNTesterActivity extends ReactActivity {
   protected String getMainComponentName() {
     return "RNTesterApp";
   }
-  }
+}
