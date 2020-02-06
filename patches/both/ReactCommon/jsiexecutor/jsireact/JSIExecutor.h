--- "E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\jsiexecutor\\jsireact\\JSIExecutor.h"	2020-01-30 13:55:48.611614400 -0800
+++ "E:\\github\\ms-react-native-forpatch\\ReactCommon\\jsiexecutor\\jsireact\\JSIExecutor.h"	2020-01-29 14:10:09.831891500 -0800
@@ -75,9 +75,8 @@
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
@@ -130,5 +129,5 @@
 using Logger =
     std::function<void(const std::string &message, unsigned int logLevel)>;
 void bindNativeLogger(jsi::Runtime &runtime, Logger logger);
-} // namespace react
+} // namespace react    
 } // namespace facebook
