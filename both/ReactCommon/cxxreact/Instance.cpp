diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/Instance.cpp b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/Instance.cpp
index 837df2a46..819968138 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/Instance.cpp
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/Instance.cpp
@@ -36,28 +36,16 @@ Instance::~Instance() {
   }
 }
 
-void Instance::setModuleRegistry(
-    std::shared_ptr<ModuleRegistry> moduleRegistry) {
-  moduleRegistry_ = std::move(moduleRegistry);
-}
-
 void Instance::initializeBridge(
     std::unique_ptr<InstanceCallback> callback,
-    std::shared_ptr<ExecutorDelegateFactory> edf,
     std::shared_ptr<JSExecutorFactory> jsef,
     std::shared_ptr<MessageQueueThread> jsQueue,
     std::shared_ptr<ModuleRegistry> moduleRegistry) {
   callback_ = std::move(callback);
   moduleRegistry_ = std::move(moduleRegistry);
-  
-  std::shared_ptr<ExecutorDelegate> delegate;
-  if (edf) {
-    delegate = edf->createExecutorDelegate(moduleRegistry_, callback_);
-  }
-
-  jsQueue->runOnQueueSync([this, delegate, &jsef, jsQueue]() mutable {
+  jsQueue->runOnQueueSync([this, &jsef, jsQueue]() mutable {
     nativeToJsBridge_ = folly::make_unique<NativeToJsBridge>(
-        jsef.get(), delegate, moduleRegistry_, jsQueue, callback_, jseConfigParams_);
+        jsef.get(), moduleRegistry_, jsQueue, callback_);
 
     std::lock_guard<std::mutex> lock(m_syncMutex);
     m_syncReady = true;
@@ -68,23 +56,25 @@ void Instance::initializeBridge(
 }
 
 void Instance::loadApplication(std::unique_ptr<RAMBundleRegistry> bundleRegistry,
-                               std::unique_ptr<const JSBigString> bundle,
-                               std::string bundleURL) { // TODO(OSS Candidate ISS#2710739)
+                               std::unique_ptr<const JSBigString> string,
+                               std::string sourceURL) {
   callback_->incrementPendingJSCalls();
-  SystraceSection s("Instance::loadApplication", "bundleURL", bundleURL);
-  nativeToJsBridge_->loadApplication(
-      std::move(bundleRegistry), std::move(bundle), std::move(bundleURL));
+  SystraceSection s("Instance::loadApplication", "sourceURL",
+                    sourceURL);
+  nativeToJsBridge_->loadApplication(std::move(bundleRegistry), std::move(string),
+                                     std::move(sourceURL));
 }
 
 void Instance::loadApplicationSync(std::unique_ptr<RAMBundleRegistry> bundleRegistry,
-                                   std::unique_ptr<const JSBigString> bundle,
-                                   std::string bundleURL) {
+                                   std::unique_ptr<const JSBigString> string,
+                                   std::string sourceURL) {
   std::unique_lock<std::mutex> lock(m_syncMutex);
   m_syncCV.wait(lock, [this] { return m_syncReady; });
 
-  SystraceSection s("Instance::loadApplicationSync", "bundleURL", bundleURL);
-  nativeToJsBridge_->loadApplicationSync(
-      std::move(bundleRegistry), std::move(bundle), std::move(bundleURL));
+  SystraceSection s("Instance::loadApplicationSync", "sourceURL",
+                    sourceURL);
+  nativeToJsBridge_->loadApplicationSync(std::move(bundleRegistry), std::move(string),
+                                         std::move(sourceURL));
 }
 
 void Instance::setSourceURL(std::string sourceURL) {
@@ -94,14 +84,15 @@ void Instance::setSourceURL(std::string sourceURL) {
   nativeToJsBridge_->loadApplication(nullptr, nullptr, std::move(sourceURL));
 }
 
-void Instance::loadScriptFromString(std::unique_ptr<const JSBigString> bundleString,
-                                    std::string bundleURL, // TODO(OSS Candidate ISS#2710739)
+void Instance::loadScriptFromString(std::unique_ptr<const JSBigString> string,
+                                    std::string sourceURL,
                                     bool loadSynchronously) {
-  SystraceSection s("Instance::loadScriptFromString", "bundleURL", bundleURL); // TODO(OSS Candidate ISS#2710739)
+  SystraceSection s("Instance::loadScriptFromString", "sourceURL",
+                    sourceURL);
   if (loadSynchronously) {
-    loadApplicationSync(nullptr, std::move(bundleString), std::move(bundleURL));
+    loadApplicationSync(nullptr, std::move(string), std::move(sourceURL));
   } else {
-    loadApplication(nullptr, std::move(bundleString), std::move(bundleURL));
+    loadApplication(nullptr, std::move(string), std::move(sourceURL));
   }
 }
 
@@ -193,10 +184,6 @@ void Instance::callJSCallback(uint64_t callbackId, folly::dynamic &&params) {
   nativeToJsBridge_->invokeCallback((double)callbackId, std::move(params));
 }
 
-void Instance::setJSEConfigParams(std::shared_ptr<JSEConfigParams>&& jseConfigParams) {
-  jseConfigParams_ = std::move(jseConfigParams);
-}
-
 void Instance::registerBundle(uint32_t bundleId, const std::string& bundlePath) {
   nativeToJsBridge_->registerBundle(bundleId, bundlePath);
 }
@@ -211,10 +198,6 @@ void Instance::handleMemoryPressure(int pressureLevel) {
   nativeToJsBridge_->handleMemoryPressure(pressureLevel);
 }
 
-int64_t Instance::getPeakJsMemoryUsage() const noexcept {
-  return nativeToJsBridge_->getPeakJsMemoryUsage();
-}
-
 void Instance::invokeAsync(std::function<void()>&& func) {
   nativeToJsBridge_->runOnExecutorQueue([func=std::move(func)](JSExecutor *executor) {
     func();
