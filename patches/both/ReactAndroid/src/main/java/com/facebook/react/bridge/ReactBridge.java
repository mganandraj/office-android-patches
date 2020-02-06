--- "E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\ReactBridge.java"	2020-01-30 13:55:48.274578500 -0800
+++ "E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\ReactBridge.java"	2020-01-29 14:10:09.363887600 -0800
@@ -18,7 +18,6 @@
   private static volatile long sLoadEndTime = 0;
 
   private static boolean sDidInit = false;
-
   public synchronized static void staticInit() {
     if (sDidInit) {
       return;
@@ -28,6 +27,14 @@
     sLoadStartTime = SystemClock.uptimeMillis();
     Systrace.beginSection(TRACE_TAG_REACT_JAVA_BRIDGE, "ReactBridge.staticInit::load:reactnativejni");
     ReactMarker.logMarker(ReactMarkerConstants.LOAD_REACT_NATIVE_SO_FILE_START);
+
+    SoLoader.loadLibrary("v8_libbase.cr");
+    SoLoader.loadLibrary("v8_libplatform.cr");
+    SoLoader.loadLibrary("v8.cr");
+
+    SoLoader.loadLibrary("glog_init");
+    SoLoader.loadLibrary("fb");
+    SoLoader.loadLibrary("yoga");
     SoLoader.loadLibrary("reactnativejni");
     ReactMarker.logMarker(ReactMarkerConstants.LOAD_REACT_NATIVE_SO_FILE_END);
     Systrace.endSection(TRACE_TAG_REACT_JAVA_BRIDGE);
@@ -41,4 +48,4 @@
   public static long getLoadEndTime() {
     return sLoadEndTime;
   }
-}
+}
\ No newline at end of file
