--- "E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\SampleCxxModule.h"	2020-01-30 13:55:48.523580800 -0800
+++ "E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\SampleCxxModule.h"	2020-01-29 14:10:09.754922800 -0800
@@ -20,10 +20,10 @@
   std::string hello();
   double add(double a, double b);
   std::string concat(const std::string& a, const std::string& b);
-  std::string repeat(int count, const std::string& str);
+  std::string repeat(int64_t count, const std::string& str);
   void save(std::map<std::string, std::string> dict);
   std::map<std::string, std::string> load();
-  void call_later(int msec, std::function<void()> f);
+  void call_later(int64_t msec, std::function<void()> f);
   void except();
   double twice(double n);
 
