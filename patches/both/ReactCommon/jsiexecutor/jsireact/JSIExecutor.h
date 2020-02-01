diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\jsiexecutor\\jsireact\\JSIExecutor.h" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\jsiexecutor\\jsireact\\JSIExecutor.h"
index 39c692f..6b633f4 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\jsiexecutor\\jsireact\\JSIExecutor.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\jsiexecutor\\jsireact\\JSIExecutor.h"
@@ -75,9 +75,8 @@ class JSIExecutor : public JSExecutor {
       std::shared_ptr<ExecutorDelegate> delegate,
       const JSIScopedTimeoutInvoker &timeoutInvoker,
       RuntimeInstaller runtimeInstaller);
-  void loadApplicationScript(
-      std::unique_ptr<const JSBigString> script,
-      std::string sourceURL) override;
+  void loadApplicationScript(std::unique_ptr<const JSBigString> script,
+                             std::string sourceURL) override;
   void setBundleRegistry(std::unique_ptr<RAMBundleRegistry>) override;
   void registerBundle(uint32_t bundleId, const std::string &bundlePath)
       override;
@@ -130,5 +129,5 @@ class JSIExecutor : public JSExecutor {
 using Logger =
     std::function<void(const std::string &message, unsigned int logLevel)>;
 void bindNativeLogger(jsi::Runtime &runtime, Logger logger);
-} // namespace react
+} // namespace react    
 } // namespace facebook
