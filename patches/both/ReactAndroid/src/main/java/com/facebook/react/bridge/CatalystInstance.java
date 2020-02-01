diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\CatalystInstance.java" "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\CatalystInstance.java"
index c7b6ced..faffba8 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\CatalystInstance.java"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactAndroid\\src\\main\\java\\com\\facebook\\react\\bridge\\CatalystInstance.java"
@@ -105,9 +105,18 @@ public interface CatalystInstance
 
   void addJSIModules(List<JSIModuleSpec> jsiModules);
 
-  /**
+   /**
    * Returns a hybrid object that contains a pointer to JSCallInvoker.
    * Required for TurboModuleManager initialization.
    */
   JSCallInvokerHolder getJSCallInvokerHolder();
+
+  /**
+   * Get the C pointer (as a long) of the underneath Instance.
+   */
+  long getPointerOfInstancePointer();
+
+  public interface CatalystInstanceEventListener {
+    void onModuleRegistryCreated(CatalystInstance catalystInstance);
+  }
 }
