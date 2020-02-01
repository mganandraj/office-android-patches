diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\ReactBridge.java" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\ReactBridge.java"
index db7edac..789f9ba 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\ReactBridge.java"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\ReactBridge.java"
@@ -18,7 +18,6 @@ public class ReactBridge {
   private static volatile long sLoadEndTime = 0;
 
   private static boolean sDidInit = false;
-
   public synchronized static void staticInit() {
     if (sDidInit) {
       return;
@@ -28,6 +27,14 @@ public class ReactBridge {
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
@@ -41,4 +48,4 @@ public class ReactBridge {
   public static long getLoadEndTime() {
     return sLoadEndTime;
   }
-}
+}
\ No newline at end of file
