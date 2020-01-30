diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/bridge/ReactBridge.java b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/bridge/ReactBridge.java
index 789f9ba32..db7edacb7 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/bridge/ReactBridge.java
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/bridge/ReactBridge.java
@@ -18,6 +18,7 @@ public class ReactBridge {
   private static volatile long sLoadEndTime = 0;
 
   private static boolean sDidInit = false;
+
   public synchronized static void staticInit() {
     if (sDidInit) {
       return;
@@ -27,14 +28,6 @@ public class ReactBridge {
     sLoadStartTime = SystemClock.uptimeMillis();
     Systrace.beginSection(TRACE_TAG_REACT_JAVA_BRIDGE, "ReactBridge.staticInit::load:reactnativejni");
     ReactMarker.logMarker(ReactMarkerConstants.LOAD_REACT_NATIVE_SO_FILE_START);
-
-    SoLoader.loadLibrary("v8_libbase.cr");
-    SoLoader.loadLibrary("v8_libplatform.cr");
-    SoLoader.loadLibrary("v8.cr");
-
-    SoLoader.loadLibrary("glog_init");
-    SoLoader.loadLibrary("fb");
-    SoLoader.loadLibrary("yoga");
     SoLoader.loadLibrary("reactnativejni");
     ReactMarker.logMarker(ReactMarkerConstants.LOAD_REACT_NATIVE_SO_FILE_END);
     Systrace.endSection(TRACE_TAG_REACT_JAVA_BRIDGE);
@@ -48,4 +41,4 @@ public class ReactBridge {
   public static long getLoadEndTime() {
     return sLoadEndTime;
   }
-}
\ No newline at end of file
+}
