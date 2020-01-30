diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/CatalystInstanceImpl.h b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/CatalystInstanceImpl.h
index 76d425b28..0ea967de1 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/CatalystInstanceImpl.h
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/CatalystInstanceImpl.h
@@ -46,18 +46,14 @@ class CatalystInstanceImpl : public jni::HybridClass<CatalystInstanceImpl> {
 
   CatalystInstanceImpl();
 
-  static bool isIndexedRAMBundle(const char *sourcePath);
-
-  void createModuleRegistry(
-     jni::alias_ref<JavaMessageQueueThread::javaobject> nativeModulesQueue,
-     jni::alias_ref<jni::JCollection<JavaModuleWrapper::javaobject>::javaobject> javaModules,
-     jni::alias_ref<jni::JCollection<ModuleHolder::javaobject>::javaobject> cxxModules);
-
   void initializeBridge(
       jni::alias_ref<ReactCallback::javaobject> callback,
       // This executor is actually a factory holder.
       JavaScriptExecutorHolder* jseh,
-      jni::alias_ref<JavaMessageQueueThread::javaobject> jsQueue);
+      jni::alias_ref<JavaMessageQueueThread::javaobject> jsQueue,
+      jni::alias_ref<JavaMessageQueueThread::javaobject> moduleQueue,
+      jni::alias_ref<jni::JCollection<JavaModuleWrapper::javaobject>::javaobject> javaModules,
+      jni::alias_ref<jni::JCollection<ModuleHolder::javaobject>::javaobject> cxxModules);
 
   void extendNativeModules(
     jni::alias_ref<jni::JCollection<JavaModuleWrapper::javaobject>::javaobject> javaModules,
@@ -84,7 +80,6 @@ class CatalystInstanceImpl : public jni::HybridClass<CatalystInstanceImpl> {
                          std::string&& jsonValue);
   jlong getJavaScriptContext();
   void handleMemoryPressure(int pressureLevel);
-  jlong getPointerOfInstancePointer();
 
   // This should be the only long-lived strong reference, but every C++ class
   // will have a weak reference.
