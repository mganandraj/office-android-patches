diff --git a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/CatalystInstanceImpl.cpp b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/CatalystInstanceImpl.cpp
index fbcc19145..28de85f7b 100644
--- a/E:/github/ms-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/CatalystInstanceImpl.cpp
+++ b/E:/github/fb-react-native-forpatch/ReactAndroid/src/main/jni/react/jni/CatalystInstanceImpl.cpp
@@ -20,8 +20,6 @@
 #include <cxxreact/ModuleRegistry.h>
 #include <cxxreact/RecoverableError.h>
 #include <cxxreact/RAMBundleRegistry.h>
-#include <cxxreact/Platform.h>
-#include <fb/Environment.h>
 #include <fb/log.h>
 #include <fb/fbjni/ByteBuffer.h>
 #include <folly/dynamic.h>
@@ -103,7 +101,6 @@ CatalystInstanceImpl::~CatalystInstanceImpl() {
 void CatalystInstanceImpl::registerNatives() {
   registerHybrid({
     makeNativeMethod("initHybrid", CatalystInstanceImpl::initHybrid),
-    makeNativeMethod("createModuleRegistry", CatalystInstanceImpl::createModuleRegistry),
     makeNativeMethod("initializeBridge", CatalystInstanceImpl::initializeBridge),
     makeNativeMethod("jniExtendNativeModules", CatalystInstanceImpl::extendNativeModules),
     makeNativeMethod("jniSetSourceURL", CatalystInstanceImpl::jniSetSourceURL),
@@ -117,34 +114,22 @@ void CatalystInstanceImpl::registerNatives() {
     makeNativeMethod("getJavaScriptContext", CatalystInstanceImpl::getJavaScriptContext),
     makeNativeMethod("getJSCallInvokerHolder", CatalystInstanceImpl::getJSCallInvokerHolder),
     makeNativeMethod("jniHandleMemoryPressure", CatalystInstanceImpl::handleMemoryPressure),
-    makeNativeMethod("getPointerOfInstancePointer", CatalystInstanceImpl::getPointerOfInstancePointer),
   });
 
   JNativeRunnable::registerNatives();
 }
 
-void CatalystInstanceImpl::createModuleRegistry(
-   jni::alias_ref<JavaMessageQueueThread::javaobject> nativeModulesQueue,
-   jni::alias_ref<jni::JCollection<JavaModuleWrapper::javaobject>::javaobject> javaModules,
-   jni::alias_ref<jni::JCollection<ModuleHolder::javaobject>::javaobject> cxxModules) {
-  moduleMessageQueue_ = std::make_shared<JMessageQueueThread>(nativeModulesQueue);
-
-  moduleRegistry_ = std::make_shared<ModuleRegistry>(
-    buildNativeModuleList(
-       std::weak_ptr<Instance>(instance_),
-       javaModules,
-       cxxModules,
-       moduleMessageQueue_
-       ));
-
-  instance_->setModuleRegistry(moduleRegistry_);
-}
-
 void CatalystInstanceImpl::initializeBridge(
     jni::alias_ref<ReactCallback::javaobject> callback,
     // This executor is actually a factory holder.
     JavaScriptExecutorHolder* jseh,
-    jni::alias_ref<JavaMessageQueueThread::javaobject> jsQueue) {
+    jni::alias_ref<JavaMessageQueueThread::javaobject> jsQueue,
+    jni::alias_ref<JavaMessageQueueThread::javaobject> nativeModulesQueue,
+    jni::alias_ref<jni::JCollection<JavaModuleWrapper::javaobject>::javaobject> javaModules,
+    jni::alias_ref<jni::JCollection<ModuleHolder::javaobject>::javaobject> cxxModules) {
+  // TODO mhorowitz: how to assert here?
+  // Assertions.assertCondition(mBridge == null, "initializeBridge should be called once");
+  moduleMessageQueue_ = std::make_shared<JMessageQueueThread>(nativeModulesQueue);
 
   // This used to be:
   //
@@ -162,11 +147,17 @@ void CatalystInstanceImpl::initializeBridge(
   // don't need jsModuleDescriptions any more, all the way up and down the
   // stack.
 
+  moduleRegistry_ = std::make_shared<ModuleRegistry>(
+    buildNativeModuleList(
+       std::weak_ptr<Instance>(instance_),
+       javaModules,
+       cxxModules,
+       moduleMessageQueue_));
+
   instance_->initializeBridge(
     std::make_unique<JInstanceCallback>(
     callback,
     moduleMessageQueue_),
-    nullptr, // Use default executor delegate
     jseh->getExecutorFactory(),
     folly::make_unique<JMessageQueueThread>(jsQueue),
     moduleRegistry_);
@@ -277,10 +268,6 @@ void CatalystInstanceImpl::handleMemoryPressure(int pressureLevel) {
   instance_->handleMemoryPressure(pressureLevel);
 }
 
-jlong CatalystInstanceImpl::getPointerOfInstancePointer() {
-  return (jlong) (intptr_t) (&instance_);
-}
-
 jni::alias_ref<JSCallInvokerHolder::javaobject> CatalystInstanceImpl::getJSCallInvokerHolder() {
   if (!javaInstanceHolder_) {
     jsCallInvoker_ = std::make_shared<BridgeJSCallInvoker>(instance_);
