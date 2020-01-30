diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/modules/timepicker/TimePickerDialogModule.java b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/modules/timepicker/TimePickerDialogModule.java
index 2f89b35da..7b3468812 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/modules/timepicker/TimePickerDialogModule.java
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/modules/timepicker/TimePickerDialogModule.java
@@ -7,7 +7,6 @@
 
 package com.facebook.react.modules.timepicker;
 
-import android.app.Activity;
 import android.app.TimePickerDialog.OnTimeSetListener;
 import android.content.DialogInterface;
 import android.content.DialogInterface.OnDismissListener;
@@ -93,16 +92,13 @@ public class TimePickerDialogModule extends ReactContextBaseJavaModule {
   @ReactMethod
   public void open(@Nullable final ReadableMap options, Promise promise) {
 
-    Activity raw_activity = getCurrentActivity();
-    if (raw_activity == null || !(raw_activity instanceof FragmentActivity)) {
+    FragmentActivity activity = (FragmentActivity) getCurrentActivity();
+    if (activity == null) {
       promise.reject(
-        ERROR_NO_ACTIVITY,
-        "Tried to open a DatePicker dialog while not attached to a FragmentActivity");
+          ERROR_NO_ACTIVITY,
+          "Tried to open a TimePicker dialog while not attached to an Activity");
       return;
     }
-
-    FragmentActivity activity = (FragmentActivity) raw_activity;
-
     // We want to support both android.app.Activity and the pre-Honeycomb FragmentActivity
     // (for apps that use it for legacy reasons). This unfortunately leads to some code duplication.
     FragmentManager fragmentManager = activity.getSupportFragmentManager();
