--- "e:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\ModuleRegistry.h"	2020-01-30 13:55:48.520581000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\ModuleRegistry.h"	2020-02-19 13:44:10.611518500 -0800
@@ -8,11 +8,12 @@
 #include <memory>
 #include <unordered_set>
 #include <vector>
-
 #include <cxxreact/JSExecutor.h>
 #include <folly/Optional.h>
 #include <folly/dynamic.h>
 
+#include <cxxreact/NativeModule.h>
+
 #ifndef RN_EXPORT
 #define RN_EXPORT __attribute__((visibility("default")))
 #endif
@@ -41,6 +42,12 @@
   ModuleRegistry(std::vector<std::unique_ptr<NativeModule>> modules, ModuleNotFoundCallback callback = nullptr);
   void registerModules(std::vector<std::unique_ptr<NativeModule>> modules);
 
+  // Remove this after Task #1895397 completed.
+  size_t GetModuleSize()
+  {
+    return modules_.size();
+  }
+
   std::vector<std::string> moduleNames();
 
   folly::Optional<ModuleConfig> getConfig(const std::string& name);
