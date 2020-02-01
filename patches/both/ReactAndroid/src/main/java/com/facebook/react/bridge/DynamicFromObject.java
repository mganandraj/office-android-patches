diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\DynamicFromObject.java" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\DynamicFromObject.java"
index 3f7f24b..2851765 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\DynamicFromObject.java"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\DynamicFromObject.java"
@@ -7,7 +7,8 @@
 
 package com.facebook.react.bridge;
 
-import com.facebook.common.logging.FLog;
+// Using Flog causes issue with Processor hence commenting its usage.
+// import com.facebook.common.logging.FLog;
 import com.facebook.react.common.ReactConstants;
 import javax.annotation.Nullable;
 
@@ -82,7 +83,7 @@ public class DynamicFromObject implements Dynamic {
     if (mObject instanceof ReadableArray) {
       return ReadableType.Array;
     }
-    FLog.e(ReactConstants.TAG, "Unmapped object type " + mObject.getClass().getName());
+    // FLog.e(ReactConstants.TAG, "Unmapped object type " + mObject.getClass().getName());
     return ReadableType.Null;
   }
 }
