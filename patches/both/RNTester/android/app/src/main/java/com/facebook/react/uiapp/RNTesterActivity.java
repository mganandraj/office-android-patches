--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\android\\app\\src\\main\\java\\com\\facebook\\react\\uiapp\\RNTesterActivity.java"	2020-01-30 13:55:48.068609100 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\android\\app\\src\\main\\java\\com\\facebook\\react\\uiapp\\RNTesterActivity.java"	2020-01-29 14:10:09.139887600 -0800
@@ -9,14 +9,23 @@
 package com.facebook.react.uiapp;
 
 import android.os.Bundle;
+import android.system.ErrnoException;
+import android.system.Os;
+import android.util.Log;
 
 import com.facebook.react.ReactActivity;
 import com.facebook.react.ReactActivityDelegate;
+import com.facebook.react.ReactInstanceManager;
+import com.facebook.react.bridge.CatalystInstance;
+import com.facebook.react.bridge.ReactContext;
+
+import java.io.File;
 
 import javax.annotation.Nullable;
 
 public class RNTesterActivity extends ReactActivity {
   public static class RNTesterActivityDelegate extends ReactActivityDelegate {
+    private static final String LOG_TAG = "RNTesterActivity";
     private static final String PARAM_ROUTE = "route";
     private Bundle mInitialProps = null;
     private final @Nullable ReactActivity mActivity;
@@ -38,12 +47,8 @@
         mInitialProps = new Bundle();
         mInitialProps.putString("exampleFromAppetizeParams", routeUri);
       }
-      super.onCreate(savedInstanceState);
-    }
 
-    @Override
-    protected Bundle getLaunchOptions() {
-      return mInitialProps;
+      super.onCreate(savedInstanceState);
     }
   }
 
@@ -56,4 +61,4 @@
   protected String getMainComponentName() {
     return "RNTesterApp";
   }
-}
+  }
