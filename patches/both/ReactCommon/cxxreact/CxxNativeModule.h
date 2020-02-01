diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\CxxNativeModule.h" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\CxxNativeModule.h"
index d28fac9..2bf303f 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\CxxNativeModule.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\CxxNativeModule.h"
@@ -38,6 +38,12 @@ public:
   void invoke(unsigned int reactMethodId, folly::dynamic&& params, int callId) override;
   MethodCallResult callSerializableNativeHook(unsigned int hookId, folly::dynamic&& args) override;
 
+  // Adding this factory method so that Office Android can delay load binary reactnativejni
+  static std::unique_ptr<CxxNativeModule> Make(std::weak_ptr<Instance> instance,
+                                               std::string name,
+                                               xplat::module::CxxModule::Provider provider,
+                                               std::shared_ptr<MessageQueueThread> messageQueueThread);
+
 private:
   void lazyInit();
 
