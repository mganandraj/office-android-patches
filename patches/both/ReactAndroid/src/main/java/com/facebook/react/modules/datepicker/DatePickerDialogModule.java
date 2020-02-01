diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\modules\\datepicker\\DatePickerDialogModule.java" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\modules\\datepicker\\DatePickerDialogModule.java"
index 0ac3046..7619d33 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\modules\\datepicker\\DatePickerDialogModule.java"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\modules\\datepicker\\DatePickerDialogModule.java"
@@ -7,7 +7,7 @@
 
 package com.facebook.react.modules.datepicker;
 
-
+import android.app.Activity;
 import android.app.DatePickerDialog.OnDateSetListener;
 import android.content.DialogInterface;
 import android.content.DialogInterface.OnDismissListener;
@@ -112,14 +112,16 @@ public class DatePickerDialogModule extends ReactContextBaseJavaModule {
    */
   @ReactMethod
   public void open(@Nullable final ReadableMap options, Promise promise) {
-    FragmentActivity activity = (FragmentActivity) getCurrentActivity();
-    if (activity == null) {
+    Activity raw_activity = getCurrentActivity();
+    if (raw_activity == null || !(raw_activity instanceof FragmentActivity)) {
       promise.reject(
           ERROR_NO_ACTIVITY,
-          "Tried to open a DatePicker dialog while not attached to an Activity");
+          "Tried to open a DatePicker dialog while not attached to a FragmentActivity");
       return;
     }
 
+    FragmentActivity activity = (FragmentActivity) raw_activity;
+
     FragmentManager fragmentManager = activity.getSupportFragmentManager();
     DialogFragment oldFragment = (DialogFragment) fragmentManager.findFragmentByTag(FRAGMENT_TAG);
     if (oldFragment != null) {
