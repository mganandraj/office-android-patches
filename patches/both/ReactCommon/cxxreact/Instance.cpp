--- "E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\Instance.cpp"	2020-01-30 13:55:48.514580900 -0800
+++ "E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\Instance.cpp"	2020-01-29 14:10:09.747921600 -0800
@@ -36,16 +36,28 @@
   }
 }
 
+void Instance::setModuleRegistry(
+    std::shared_ptr<ModuleRegistry> moduleRegistry) {
+  moduleRegistry_ = std::move(moduleRegistry);
+}
+
 void Instance::initializeBridge(
     std::unique_ptr<InstanceCallback> callback,
+    std::shared_ptr<ExecutorDelegateFactory> edf,
     std::shared_ptr<JSExecutorFactory> jsef,
     std::shared_ptr<MessageQueueThread> jsQueue,
     std::shared_ptr<ModuleRegistry> moduleRegistry) {
   callback_ = std::move(callback);
   moduleRegistry_ = std::move(moduleRegistry);
-  jsQueue->runOnQueueSync([this, &jsef, jsQueue]() mutable {
+  
+  std::shared_ptr<ExecutorDelegate> delegate;
+  if (edf) {
+    delegate = edf->createExecutorDelegate(moduleRegistry_, callback_);
+  }
+
+  jsQueue->runOnQueueSync([this, delegate, &jsef, jsQueue]() mutable {
     nativeToJsBridge_ = folly::make_unique<NativeToJsBridge>(
-        jsef.get(), moduleRegistry_, jsQueue, callback_);
+        jsef.get(), delegate, moduleRegistry_, jsQueue, callback_, jseConfigParams_);
 
     std::lock_guard<std::mutex> lock(m_syncMutex);
     m_syncReady = true;
@@ -56,25 +68,23 @@
 }
 
 void Instance::loadApplication(std::unique_ptr<RAMBundleRegistry> bundleRegistry,
-                               std::unique_ptr<const JSBigString> string,
-                               std::string sourceURL) {
+                               std::unique_ptr<const JSBigString> bundle,
+                               std::string bundleURL) { // TODO(OSS Candidate ISS#2710739)
   callback_->incrementPendingJSCalls();
-  SystraceSection s("Instance::loadApplication", "sourceURL",
-                    sourceURL);
-  nativeToJsBridge_->loadApplication(std::move(bundleRegistry), std::move(string),
-                                     std::move(sourceURL));
+  SystraceSection s("Instance::loadApplication", "bundleURL", bundleURL);
+  nativeToJsBridge_->loadApplication(
+      std::move(bundleRegistry), std::move(bundle), std::move(bundleURL));
 }
 
 void Instance::loadApplicationSync(std::unique_ptr<RAMBundleRegistry> bundleRegistry,
-                                   std::unique_ptr<const JSBigString> string,
-                                   std::string sourceURL) {
+                                   std::unique_ptr<const JSBigString> bundle,
+                                   std::string bundleURL) {
   std::unique_lock<std::mutex> lock(m_syncMutex);
   m_syncCV.wait(lock, [this] { return m_syncReady; });
 
-  SystraceSection s("Instance::loadApplicationSync", "sourceURL",
-                    sourceURL);
-  nativeToJsBridge_->loadApplicationSync(std::move(bundleRegistry), std::move(string),
-                                         std::move(sourceURL));
+  SystraceSection s("Instance::loadApplicationSync", "bundleURL", bundleURL);
+  nativeToJsBridge_->loadApplicationSync(
+      std::move(bundleRegistry), std::move(bundle), std::move(bundleURL));
 }
 
 void Instance::setSourceURL(std::string sourceURL) {
@@ -84,15 +94,14 @@
   nativeToJsBridge_->loadApplication(nullptr, nullptr, std::move(sourceURL));
 }
 
-void Instance::loadScriptFromString(std::unique_ptr<const JSBigString> string,
-                                    std::string sourceURL,
+void Instance::loadScriptFromString(std::unique_ptr<const JSBigString> bundleString,
+                                    std::string bundleURL, // TODO(OSS Candidate ISS#2710739)
                                     bool loadSynchronously) {
-  SystraceSection s("Instance::loadScriptFromString", "sourceURL",
-                    sourceURL);
+  SystraceSection s("Instance::loadScriptFromString", "bundleURL", bundleURL); // TODO(OSS Candidate ISS#2710739)
   if (loadSynchronously) {
-    loadApplicationSync(nullptr, std::move(string), std::move(sourceURL));
+    loadApplicationSync(nullptr, std::move(bundleString), std::move(bundleURL));
   } else {
-    loadApplication(nullptr, std::move(string), std::move(sourceURL));
+    loadApplication(nullptr, std::move(bundleString), std::move(bundleURL));
   }
 }
 
@@ -184,6 +193,10 @@
   nativeToJsBridge_->invokeCallback((double)callbackId, std::move(params));
 }
 
+void Instance::setJSEConfigParams(std::shared_ptr<JSEConfigParams>&& jseConfigParams) {
+  jseConfigParams_ = std::move(jseConfigParams);
+}
+
 void Instance::registerBundle(uint32_t bundleId, const std::string& bundlePath) {
   nativeToJsBridge_->registerBundle(bundleId, bundlePath);
 }
@@ -198,6 +211,10 @@
   nativeToJsBridge_->handleMemoryPressure(pressureLevel);
 }
 
+int64_t Instance::getPeakJsMemoryUsage() const noexcept {
+  return nativeToJsBridge_->getPeakJsMemoryUsage();
+}
+
 void Instance::invokeAsync(std::function<void()>&& func) {
   nativeToJsBridge_->runOnExecutorQueue([func=std::move(func)](JSExecutor *executor) {
     func();
