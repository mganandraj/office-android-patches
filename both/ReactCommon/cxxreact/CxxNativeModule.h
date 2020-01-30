diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/CxxNativeModule.h b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/CxxNativeModule.h
index 2bf303f46..d28fac97f 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/CxxNativeModule.h
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/CxxNativeModule.h
@@ -38,12 +38,6 @@ public:
   void invoke(unsigned int reactMethodId, folly::dynamic&& params, int callId) override;
   MethodCallResult callSerializableNativeHook(unsigned int hookId, folly::dynamic&& args) override;
 
-  // Adding this factory method so that Office Android can delay load binary reactnativejni
-  static std::unique_ptr<CxxNativeModule> Make(std::weak_ptr<Instance> instance,
-                                               std::string name,
-                                               xplat::module::CxxModule::Provider provider,
-                                               std::shared_ptr<MessageQueueThread> messageQueueThread);
-
 private:
   void lazyInit();
 
