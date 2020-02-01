diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\CxxNativeModule.cpp" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\CxxNativeModule.cpp"
index 2b674c0..cb29e98 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\CxxNativeModule.cpp"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\CxxNativeModule.cpp"
@@ -142,7 +142,7 @@ void CxxNativeModule::invoke(unsigned int reactMethodId, folly::dynamic&& params
     SystraceSection s(method.name.c_str());
     try {
       method.func(std::move(params), first, second);
-    } catch (const facebook::xplat::JsArgumentException& ex) {
+    } catch (const facebook::xplat::JsArgumentException&) {
       throw;
     } catch (std::exception& e) {
       LOG(ERROR) << "std::exception. Method call " << method.name.c_str() << " failed: " << e.what();
@@ -188,5 +188,18 @@ void CxxNativeModule::lazyInit() {
   }
 }
 
+// Adding this factory method so that Office Android can delay load binary reactnativejni
+std::unique_ptr<CxxNativeModule> Make(std::weak_ptr<Instance> instance,
+    std::string name,
+    xplat::module::CxxModule::Provider provider,
+    std::shared_ptr<MessageQueueThread> messageQueueThread)
+{
+    return std::make_unique<facebook::react::CxxNativeModule>(
+        instance,
+        std::move(name) /*ModuleName*/,
+        std::move(provider) /*Provider*/,
+        std::move(messageQueueThread));
+}
+
 }
 }
