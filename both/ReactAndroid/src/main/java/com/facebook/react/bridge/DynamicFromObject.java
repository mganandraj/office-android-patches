diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/bridge/DynamicFromObject.java b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/bridge/DynamicFromObject.java
index 285176573..3f7f24bf0 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/bridge/DynamicFromObject.java
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/bridge/DynamicFromObject.java
@@ -7,8 +7,7 @@
 
 package com.facebook.react.bridge;
 
-// Using Flog causes issue with Processor hence commenting its usage.
-// import com.facebook.common.logging.FLog;
+import com.facebook.common.logging.FLog;
 import com.facebook.react.common.ReactConstants;
 import javax.annotation.Nullable;
 
@@ -83,7 +82,7 @@ public class DynamicFromObject implements Dynamic {
     if (mObject instanceof ReadableArray) {
       return ReadableType.Array;
     }
-    // FLog.e(ReactConstants.TAG, "Unmapped object type " + mObject.getClass().getName());
+    FLog.e(ReactConstants.TAG, "Unmapped object type " + mObject.getClass().getName());
     return ReadableType.Null;
   }
 }
