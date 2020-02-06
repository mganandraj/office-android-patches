--- "E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\JSExecutor.h"	2020-01-30 13:55:48.517581300 -0800
+++ "E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\JSExecutor.h"	2020-01-29 14:10:09.749922100 -0800
@@ -7,7 +7,9 @@
 
 #include <memory>
 #include <string>
+#include <cassert>
 
+#include <cxxreact/ModuleRegistry.h>
 #include <cxxreact/NativeModule.h>
 #include <folly/dynamic.h>
 
@@ -19,11 +21,21 @@
 namespace react {
 
 class JSBigString;
+class ExecutorDelegate;
 class JSExecutor;
 class JSModulesUnbundle;
 class MessageQueueThread;
-class ModuleRegistry;
 class RAMBundleRegistry;
+struct InstanceCallback;
+struct JSEConfigParams;
+
+class ExecutorDelegateFactory {
+public:
+  virtual std::unique_ptr<ExecutorDelegate> createExecutorDelegate(
+    std::shared_ptr<ModuleRegistry> registry,
+    std::shared_ptr<InstanceCallback> callback) = 0;
+  virtual ~ExecutorDelegateFactory() {}
+};
 
 // This interface describes the delegate interface required by
 // Executor implementations to call from JS into native code.
@@ -37,6 +49,8 @@
     JSExecutor& executor, folly::dynamic&& calls, bool isEndOfBatch) = 0;
   virtual MethodCallResult callSerializableNativeHook(
     JSExecutor& executor, unsigned int moduleId, unsigned int methodId, folly::dynamic&& args) = 0;
+
+  virtual bool isBatchActive() = 0;
 };
 
 using NativeExtensionsProvider = std::function<folly::dynamic(const std::string&)>;
@@ -46,6 +60,14 @@
   virtual std::unique_ptr<JSExecutor> createJSExecutor(
     std::shared_ptr<ExecutorDelegate> delegate,
     std::shared_ptr<MessageQueueThread> jsQueue) = 0;
+
+  virtual std::unique_ptr<JSExecutor> createJSExecutor(
+    std::shared_ptr<ExecutorDelegate> delegate,
+    std::shared_ptr<MessageQueueThread> jsQueue,
+    std::shared_ptr<JSEConfigParams> /*jseConfigParams*/) {
+      return createJSExecutor(std::move(delegate),std::move(jsQueue));
+  }
+
   virtual ~JSExecutorFactory() {}
 };
 
@@ -105,6 +127,15 @@
 
   virtual void handleMemoryPressure(__unused int pressureLevel) {}
 
+  /**
+   * Returns the current peak memory usage due to the JavaScript
+   * execution environment in bytes. If the JavaScript execution
+   * environment does not track this information, return -1.
+   */
+  virtual int64_t getPeakJsMemoryUsage() const noexcept { // ISS
+    return -1;
+  }
+
   virtual void destroy() {}
   virtual ~JSExecutor() {}
 
