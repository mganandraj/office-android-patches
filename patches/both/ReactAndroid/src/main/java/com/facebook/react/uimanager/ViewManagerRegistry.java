diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\ViewManagerRegistry.java" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\ViewManagerRegistry.java"
index b657eb5..6fbb77c 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\ViewManagerRegistry.java"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\uimanager\\ViewManagerRegistry.java"
@@ -8,9 +8,12 @@
 package com.facebook.react.uimanager;
 
 import com.facebook.react.common.MapBuilder;
+import com.facebook.react.common.ReactConstants;
+import java.util.HashMap;
 import java.util.List;
 import java.util.Map;
 import javax.annotation.Nullable;
+import android.util.Log;
 
 /**
  * Class that stores the mapping between native view name used in JS and the corresponding instance
@@ -20,6 +23,16 @@ public final class ViewManagerRegistry {
 
   private final Map<String, ViewManager> mViewManagers;
   private final @Nullable UIManagerModule.ViewManagerResolver mViewManagerResolver;
+  private static Map<String, String> sComponentNames = new HashMap<>();
+
+  static {
+    sComponentNames.put("Image", "RCTImageView");
+    sComponentNames.put("ForwardRef(Image)", "RCTImageView");
+    sComponentNames.put("Text", "RCTText");
+    sComponentNames.put("TextInput", "AndroidTextInput");
+    sComponentNames.put("TouchableHighlight", "RCTView");
+    sComponentNames.put("WebView", "RCTWebView");
+  }
 
   public ViewManagerRegistry(UIManagerModule.ViewManagerResolver viewManagerResolver) {
     mViewManagers = MapBuilder.newHashMap();
@@ -43,17 +56,25 @@ public final class ViewManagerRegistry {
   }
 
   public ViewManager get(String className) {
-    ViewManager viewManager = mViewManagers.get(className);
+    String newClassName;
+    if (sComponentNames.containsKey(className)) {
+      newClassName = sComponentNames.get(className);
+    } else {
+      newClassName = className;
+    }
+
+    ViewManager viewManager = mViewManagers.get(newClassName);
     if (viewManager != null) {
       return viewManager;
     }
     if (mViewManagerResolver != null) {
-      viewManager = mViewManagerResolver.getViewManager(className);
+      viewManager = mViewManagerResolver.getViewManager(newClassName);
       if (viewManager != null) {
-        mViewManagers.put(className, viewManager);
+        mViewManagers.put(newClassName, viewManager);
         return viewManager;
       }
     }
-    throw new IllegalViewOperationException("No ViewManager defined for class " + className);
+    Log.w(ReactConstants.TAG, "No ViewManager defined for class: " + newClassName);
+    throw new IllegalViewOperationException("No ViewManager defined for class " + newClassName);
   }
 }
