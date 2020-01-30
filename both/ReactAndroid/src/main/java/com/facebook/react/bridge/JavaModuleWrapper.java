diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/bridge/JavaModuleWrapper.java b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/bridge/JavaModuleWrapper.java
index 980462080..af8b0fbee 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/bridge/JavaModuleWrapper.java
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/java/com/facebook/react/bridge/JavaModuleWrapper.java
@@ -36,7 +36,7 @@ import static com.facebook.systrace.Systrace.TRACE_TAG_REACT_JAVA_BRIDGE;
 @DoNotStrip
 public class JavaModuleWrapper {
   @DoNotStrip
-  public static class MethodDescriptor {
+  public class MethodDescriptor {
     @DoNotStrip
     Method method;
     @DoNotStrip
@@ -46,8 +46,8 @@ public class JavaModuleWrapper {
     @DoNotStrip
     String type;
   }
-  
-  protected final JSInstance mJSInstance;
+
+  private final JSInstance mJSInstance;
   private final ModuleHolder mModuleHolder;
   private final ArrayList<NativeModule.NativeMethod> mMethods;
   private final ArrayList<MethodDescriptor> mDescs;
