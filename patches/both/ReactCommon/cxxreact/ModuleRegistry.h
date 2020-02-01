diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\ModuleRegistry.h" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\ModuleRegistry.h"
index 65d9531..b76d962 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\ModuleRegistry.h"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\ModuleRegistry.h"
@@ -9,7 +9,7 @@
 #include <unordered_set>
 #include <vector>
 
-#include <cxxreact/JSExecutor.h>
+#include <cxxreact/NativeModule.h>
 #include <folly/Optional.h>
 #include <folly/dynamic.h>
 
@@ -41,6 +41,12 @@ class RN_EXPORT ModuleRegistry {
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
