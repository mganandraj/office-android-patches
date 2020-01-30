diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/ModuleRegistry.h b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/ModuleRegistry.h
index b76d96261..65d95315c 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/ModuleRegistry.h
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/ModuleRegistry.h
@@ -9,7 +9,7 @@
 #include <unordered_set>
 #include <vector>
 
-#include <cxxreact/NativeModule.h>
+#include <cxxreact/JSExecutor.h>
 #include <folly/Optional.h>
 #include <folly/dynamic.h>
 
@@ -41,12 +41,6 @@ class RN_EXPORT ModuleRegistry {
   ModuleRegistry(std::vector<std::unique_ptr<NativeModule>> modules, ModuleNotFoundCallback callback = nullptr);
   void registerModules(std::vector<std::unique_ptr<NativeModule>> modules);
 
-  // Remove this after Task #1895397 completed.
-  size_t GetModuleSize()
-  {
-    return modules_.size();
-  }
-
   std::vector<std::string> moduleNames();
 
   folly::Optional<ModuleConfig> getConfig(const std::string& name);
