diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\NativeToJsBridge.cpp" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\NativeToJsBridge.cpp"
index 2c3893e..c9cace9 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\NativeToJsBridge.cpp"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\NativeToJsBridge.cpp"
@@ -38,7 +38,7 @@ public:
     return m_registry;
   }
   
-  bool isBatchActive() {
+  virtual bool isBatchActive() override {
     return m_batchHadNativeModuleCalls;
   }
 
@@ -58,7 +58,7 @@ public:
     if (isEndOfBatch) {
       // onBatchComplete will be called on the native (module) queue, but
       // decrementPendingJSCalls will be called sync. Be aware that the bridge may still
-      // be processing native calls when the birdge idle signaler fires.
+      // be processing native calls when the bridge idle signaler fires.
       if (m_batchHadNativeModuleCalls) {
         m_callback->onBatchComplete();
         m_batchHadNativeModuleCalls = false;
@@ -85,12 +85,14 @@ private:
 
 NativeToJsBridge::NativeToJsBridge(
     JSExecutorFactory *jsExecutorFactory,
+    std::shared_ptr<ExecutorDelegate> delegate, // TODO(OSS Candidate ISS#2710739)
     std::shared_ptr<ModuleRegistry> registry,
     std::shared_ptr<MessageQueueThread> jsQueue,
-    std::shared_ptr<InstanceCallback> callback)
+    std::shared_ptr<InstanceCallback> callback,
+    std::shared_ptr<JSEConfigParams> jseConfigParams)
     : m_destroyed(std::make_shared<bool>(false)),
-      m_delegate(std::make_shared<JsToNativeBridge>(registry, callback)),
-      m_executor(jsExecutorFactory->createJSExecutor(m_delegate, jsQueue)),
+      m_delegate(delegate ? delegate : (std::make_shared<JsToNativeBridge>(registry, callback))),
+      m_executor(jsExecutorFactory->createJSExecutor(m_delegate, jsQueue, std::move(jseConfigParams))),
       m_executorMessageQueueThread(std::move(jsQueue)),
       m_inspectable(m_executor->isInspectable()) {}
 
@@ -116,8 +118,8 @@ void NativeToJsBridge::loadApplication(
       executor->setBundleRegistry(std::move(bundleRegistry));
     }
     try {
-      executor->loadApplicationScript(std::move(*startupScript),
-                                      std::move(startupScriptSourceURL));
+      executor->loadApplicationScript(
+          std::move(*startupScript), std::move(startupScriptSourceURL));
     } catch (...) {
       m_applicationScriptHasFailure = true;
       throw;
@@ -133,8 +135,8 @@ void NativeToJsBridge::loadApplicationSync(
     m_executor->setBundleRegistry(std::move(bundleRegistry));
   }
   try {
-    m_executor->loadApplicationScript(std::move(startupScript),
-                                          std::move(startupScriptSourceURL));
+    m_executor->loadApplicationScript(
+        std::move(startupScript), std::move(startupScriptSourceURL));
   } catch (...) {
     m_applicationScriptHasFailure = true;
     throw;
@@ -239,6 +241,10 @@ void NativeToJsBridge::handleMemoryPressure(int pressureLevel) {
   });
 }
 
+int64_t NativeToJsBridge::getPeakJsMemoryUsage() const noexcept {
+  return m_executor->getPeakJsMemoryUsage();
+}
+
 void NativeToJsBridge::destroy() {
   // All calls made through runOnExecutorQueue have an early exit if
   // m_destroyed is true. Setting this before the runOnQueueSync will cause
