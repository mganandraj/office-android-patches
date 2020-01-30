diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/modules/datepicker/DatePickerDialogModule.java b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/modules/datepicker/DatePickerDialogModule.java
index 7619d335e..0ac304693 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/modules/datepicker/DatePickerDialogModule.java
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/modules/datepicker/DatePickerDialogModule.java
@@ -7,7 +7,7 @@
 
 package com.facebook.react.modules.datepicker;
 
-import android.app.Activity;
+
 import android.app.DatePickerDialog.OnDateSetListener;
 import android.content.DialogInterface;
 import android.content.DialogInterface.OnDismissListener;
@@ -112,16 +112,14 @@ public class DatePickerDialogModule extends ReactContextBaseJavaModule {
    */
   @ReactMethod
   public void open(@Nullable final ReadableMap options, Promise promise) {
-    Activity raw_activity = getCurrentActivity();
-    if (raw_activity == null || !(raw_activity instanceof FragmentActivity)) {
+    FragmentActivity activity = (FragmentActivity) getCurrentActivity();
+    if (activity == null) {
       promise.reject(
           ERROR_NO_ACTIVITY,
-          "Tried to open a DatePicker dialog while not attached to a FragmentActivity");
+          "Tried to open a DatePicker dialog while not attached to an Activity");
       return;
     }
 
-    FragmentActivity activity = (FragmentActivity) raw_activity;
-
     FragmentManager fragmentManager = activity.getSupportFragmentManager();
     DialogFragment oldFragment = (DialogFragment) fragmentManager.findFragmentByTag(FRAGMENT_TAG);
     if (oldFragment != null) {
