--- "E:\\github\\fb-react-native-forpatch-base\\RNTester\\android\\app\\src\\main\\java\\com\\facebook\\react\\uiapp\\RNTesterApplication.java"	2020-01-30 13:55:48.068609100 -0800
+++ "E:\\github\\ms-react-native-forpatch\\RNTester\\android\\app\\src\\main\\java\\com\\facebook\\react\\uiapp\\RNTesterApplication.java"	2020-01-29 14:10:09.140885000 -0800
@@ -9,19 +9,48 @@
 package com.facebook.react.uiapp;
 
 import android.app.Application;
+import android.content.Context;
+import android.util.Log;
 
 import com.facebook.react.BuildConfig;
 import com.facebook.react.ReactApplication;
 import com.facebook.react.ReactNativeHost;
 import com.facebook.react.ReactPackage;
+import com.facebook.react.bridge.JavaScriptExecutorFactory;
+import com.facebook.react.bridge.ReactMarker;
+import com.facebook.react.bridge.ReactMarkerConstants;
 import com.facebook.react.shell.MainReactPackage;
+import com.facebook.react.v8executor.V8ExecutorFactory;
 import com.facebook.react.views.text.ReactFontManager;
 
+
+import java.io.File;
 import java.util.Arrays;
 import java.util.List;
 
+
+import static com.facebook.react.modules.systeminfo.AndroidInfoHelpers.getFriendlyDeviceName;
+
 public class RNTesterApplication extends Application implements ReactApplication {
-  private final ReactNativeHost mReactNativeHost = new ReactNativeHost(this) {
+ private static final String JSE_CACHING_DIRECTORY_NAME = "cache";
+
+  static class RNTesterReactMarker implements ReactMarker.MarkerListener {
+    final private static String LOG_TAG = "RNTesterReactMarker";
+
+    @Override
+    public void logMarker(final ReactMarkerConstants name, final String tag, final int instanceKey) {
+      StringBuilder builder = new StringBuilder();
+      String markerName = name.toString();
+      builder.append(" Marker: ").append(markerName);
+      if (tag != null) {
+        builder.append(" Tag: ").append(tag);
+      }
+      Log.i(LOG_TAG, builder.toString());
+    }
+  }
+
+ private final ReactNativeHost mReactNativeHost = new ReactNativeHost(this) {
+
     @Override
     public String getJSMainModuleName() {
       return "RNTester/js/RNTesterApp.android";
