diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/JSExecutor.h b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/JSExecutor.h
index 26069484f..bc2eb7d4e 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/JSExecutor.h
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/JSExecutor.h
@@ -7,9 +7,7 @@
 
 #include <memory>
 #include <string>
-#include <cassert>
 
-#include <cxxreact/ModuleRegistry.h>
 #include <cxxreact/NativeModule.h>
 #include <folly/dynamic.h>
 
@@ -21,21 +19,11 @@ namespace facebook {
 namespace react {
 
 class JSBigString;
-class ExecutorDelegate;
 class JSExecutor;
 class JSModulesUnbundle;
 class MessageQueueThread;
+class ModuleRegistry;
 class RAMBundleRegistry;
-struct InstanceCallback;
-struct JSEConfigParams;
-
-class ExecutorDelegateFactory {
-public:
-  virtual std::unique_ptr<ExecutorDelegate> createExecutorDelegate(
-    std::shared_ptr<ModuleRegistry> registry,
-    std::shared_ptr<InstanceCallback> callback) = 0;
-  virtual ~ExecutorDelegateFactory() {}
-};
 
 // This interface describes the delegate interface required by
 // Executor implementations to call from JS into native code.
@@ -49,8 +37,6 @@ class ExecutorDelegate {
     JSExecutor& executor, folly::dynamic&& calls, bool isEndOfBatch) = 0;
   virtual MethodCallResult callSerializableNativeHook(
     JSExecutor& executor, unsigned int moduleId, unsigned int methodId, folly::dynamic&& args) = 0;
-
-  virtual bool isBatchActive() = 0;
 };
 
 using NativeExtensionsProvider = std::function<folly::dynamic(const std::string&)>;
@@ -60,14 +46,6 @@ public:
   virtual std::unique_ptr<JSExecutor> createJSExecutor(
     std::shared_ptr<ExecutorDelegate> delegate,
     std::shared_ptr<MessageQueueThread> jsQueue) = 0;
-
-  virtual std::unique_ptr<JSExecutor> createJSExecutor(
-    std::shared_ptr<ExecutorDelegate> delegate,
-    std::shared_ptr<MessageQueueThread> jsQueue,
-    std::shared_ptr<JSEConfigParams> /*jseConfigParams*/) {
-      return createJSExecutor(std::move(delegate),std::move(jsQueue));
-  }
-
   virtual ~JSExecutorFactory() {}
 };
 
@@ -127,15 +105,6 @@ public:
 
   virtual void handleMemoryPressure(__unused int pressureLevel) {}
 
-  /**
-   * Returns the current peak memory usage due to the JavaScript
-   * execution environment in bytes. If the JavaScript execution
-   * environment does not track this information, return -1.
-   */
-  virtual int64_t getPeakJsMemoryUsage() const noexcept { // ISS
-    return -1;
-  }
-
   virtual void destroy() {}
   virtual ~JSExecutor() {}
 
