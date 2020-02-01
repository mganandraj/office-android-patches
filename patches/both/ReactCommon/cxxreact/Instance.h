diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\Instance.h" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\Instance.h"
index b129ee7..e1fc694 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\Instance.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\Instance.h"
@@ -34,18 +34,38 @@ struct InstanceCallback {
   virtual void decrementPendingJSCalls() {}
 };
 
+enum class CachingType {
+  NoCaching,
+  PartialCaching,
+  PartialCachingWithNoLazy,
+  FullCaching,
+  FullCachingWithNoLazy
+};
+
+struct JSEConfigParams {
+  std::string cachePath;
+  CachingType cacheType;
+  int loggingLevel;
+};
+
 class RN_EXPORT Instance {
 public:
-  ~Instance();
-  void initializeBridge(std::unique_ptr<InstanceCallback> callback,
+  virtual ~Instance();
+
+  virtual void setModuleRegistry(std::shared_ptr<ModuleRegistry> moduleRegistry);
+
+  virtual void initializeBridge(std::unique_ptr<InstanceCallback> callback,
+                        std::shared_ptr<ExecutorDelegateFactory> edf, // if nullptr, will use default delegate (JsToNativeBridge) // TODO(OSS Candidate ISS#2710739)
                         std::shared_ptr<JSExecutorFactory> jsef,
                         std::shared_ptr<MessageQueueThread> jsQueue,
                         std::shared_ptr<ModuleRegistry> moduleRegistry);
 
   void setSourceURL(std::string sourceURL);
 
-  void loadScriptFromString(std::unique_ptr<const JSBigString> string,
-                            std::string sourceURL, bool loadSynchronously);
+  virtual void loadScriptFromString(
+      std::unique_ptr<const JSBigString> bundleString,
+      std::string bundleURL,
+      bool loadSynchronously);
   static bool isIndexedRAMBundle(const char *sourcePath);
   static bool isIndexedRAMBundle(std::unique_ptr<const JSBigString>* string);
   void loadRAMBundleFromString(std::unique_ptr<const JSBigString> script, const std::string& sourceURL);
@@ -64,6 +84,7 @@ public:
   void callJSFunction(std::string &&module, std::string &&method,
                       folly::dynamic &&params);
   void callJSCallback(uint64_t callbackId, folly::dynamic &&params);
+  virtual void setJSEConfigParams(std::shared_ptr<JSEConfigParams>&& jseConfigParams);
 
   // This method is experimental, and may be modified or removed.
   void registerBundle(uint32_t bundleId, const std::string& bundlePath);
@@ -73,20 +94,28 @@ public:
 
   void handleMemoryPressure(int pressureLevel);
 
+   /**
+   * Returns the current peak memory usage due to the JavaScript
+   * execution environment in bytes. If the JavaScript execution
+   * environment does not track this information, return -1.
+   */
+  int64_t getPeakJsMemoryUsage() const noexcept;
+
   void invokeAsync(std::function<void()>&& func);
 
 private:
   void callNativeModules(folly::dynamic &&calls, bool isEndOfBatch);
-  void loadApplication(std::unique_ptr<RAMBundleRegistry> bundleRegistry,
-                       std::unique_ptr<const JSBigString> startupScript,
-                       std::string startupScriptSourceURL);
-  void loadApplicationSync(std::unique_ptr<RAMBundleRegistry> bundleRegistry,
-                           std::unique_ptr<const JSBigString> startupScript,
-                           std::string startupScriptSourceURL);
+  virtual void loadApplication(std::unique_ptr<RAMBundleRegistry> bundleRegistry,
+                       std::unique_ptr<const JSBigString> bundle,
+                       std::string bundleURL);
+  virtual void loadApplicationSync(std::unique_ptr<RAMBundleRegistry> bundleRegistry,
+                           std::unique_ptr<const JSBigString> bundle,
+                           std::string bundleURL);
 
   std::shared_ptr<InstanceCallback> callback_;
   std::unique_ptr<NativeToJsBridge> nativeToJsBridge_;
   std::shared_ptr<ModuleRegistry> moduleRegistry_;
+  std::shared_ptr<JSEConfigParams> jseConfigParams_;
 
   std::mutex m_syncMutex;
   std::condition_variable m_syncCV;
