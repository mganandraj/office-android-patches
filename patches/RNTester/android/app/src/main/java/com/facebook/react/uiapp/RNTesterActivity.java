--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\android\\app\\src\\main\\java\\com\\facebook\\react\\uiapp\\RNTesterActivity.java"	2020-01-30 13:55:48.068609100 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\android\\app\\src\\main\\java\\com\\facebook\\react\\uiapp\\RNTesterActivity.java"	2020-02-13 14:18:01.594276400 -0800
@@ -17,6 +17,7 @@
 
 public class RNTesterActivity extends ReactActivity {
   public static class RNTesterActivityDelegate extends ReactActivityDelegate {
+    private static final String LOG_TAG = "RNTesterActivity";
     private static final String PARAM_ROUTE = "route";
     private Bundle mInitialProps = null;
     private final @Nullable ReactActivity mActivity;
@@ -38,12 +39,8 @@
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
 
@@ -56,4 +53,4 @@
   protected String getMainComponentName() {
     return "RNTesterApp";
   }
-}
+  }
