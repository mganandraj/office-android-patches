diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\NativeToJsBridge.h" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\NativeToJsBridge.h"
index bf5746a..142e3cb 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\NativeToJsBridge.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\NativeToJsBridge.h"
@@ -40,10 +40,12 @@ public:
    * This must be called on the main JS thread.
    */
   NativeToJsBridge(
-      JSExecutorFactory* jsExecutorFactory,
-      std::shared_ptr<ModuleRegistry> registry,
-      std::shared_ptr<MessageQueueThread> jsQueue,
-      std::shared_ptr<InstanceCallback> callback);
+    JSExecutorFactory* jsExecutorFactory,
+    std::shared_ptr<ExecutorDelegate> delegate, // TODO(OSS Candidate ISS#2710739)
+    std::shared_ptr<ModuleRegistry> registry,
+    std::shared_ptr<MessageQueueThread> jsQueue,
+    std::shared_ptr<InstanceCallback> callback,
+    std::shared_ptr<JSEConfigParams> jseConfigParams);
   virtual ~NativeToJsBridge();
 
   /**
@@ -64,12 +66,12 @@ public:
    */
   void loadApplication(
     std::unique_ptr<RAMBundleRegistry> bundleRegistry,
-    std::unique_ptr<const JSBigString> startupCode,
-    std::string sourceURL);
+    std::unique_ptr<const JSBigString> bundle,
+    std::string bundleURL);
   void loadApplicationSync(
     std::unique_ptr<RAMBundleRegistry> bundleRegistry,
-    std::unique_ptr<const JSBigString> startupCode,
-    std::string sourceURL);
+    std::unique_ptr<const JSBigString> bundle,
+    std::string bundleURL);
 
   void registerBundle(uint32_t bundleId, const std::string& bundlePath);
   void setGlobalVariable(std::string propName, std::unique_ptr<const JSBigString> jsonValue);
@@ -79,6 +81,13 @@ public:
 
   void handleMemoryPressure(int pressureLevel);
 
+  /**
+   * Returns the current peak memory usage due to m_executor's JavaScript
+   * execution environment in bytes. If m_executor does not track this
+   * information, return -1.
+   */
+  int64_t getPeakJsMemoryUsage() const noexcept;
+
   /**
    * Synchronously tears down the bridge and the main executor.
    */
@@ -92,7 +101,7 @@ private:
   // will try to run the task on m_callback which will have been destroyed
   // within ~NativeToJsBridge(), thus causing a SIGSEGV.
   std::shared_ptr<bool> m_destroyed;
-  std::shared_ptr<JsToNativeBridge> m_delegate;
+  std::shared_ptr<react::ExecutorDelegate> m_delegate; // TODO(OSS Candidate ISS#2710739)
   std::unique_ptr<JSExecutor> m_executor;
   std::shared_ptr<MessageQueueThread> m_executorMessageQueueThread;
 
@@ -107,7 +116,7 @@ private:
   bool m_applicationScriptHasFailure = false;
 
   #ifdef WITH_FBSYSTRACE
-  std::atomic_uint_least32_t m_systraceCookie = ATOMIC_VAR_INIT();
+  std::atomic_uint_least32_t m_systraceCookie{};
   #endif
 };
 
