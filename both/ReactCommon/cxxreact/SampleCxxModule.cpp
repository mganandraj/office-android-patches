diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/SampleCxxModule.cpp b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/SampleCxxModule.cpp
index 9a5ec6291..e1bfb04d2 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/SampleCxxModule.cpp
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/SampleCxxModule.cpp
@@ -28,9 +28,9 @@ std::string Sample::concat(const std::string& a, const std::string& b) {
   return a + b;
 }
 
-std::string Sample::repeat(int64_t count, const std::string& str) {
+std::string Sample::repeat(int count, const std::string& str) {
   std::string ret;
-  for (int64_t i = 0; i < count; i++) {
+  for (int i = 0; i < count; i++) {
     ret += str;
   }
 
@@ -52,7 +52,7 @@ void Sample::except() {
   // throw std::runtime_error("oops");
 }
 
-void Sample::call_later(int64_t msec, std::function<void()> f) {
+void Sample::call_later(int msec, std::function<void()> f) {
   std::thread t([=] {
       std::this_thread::sleep_for(std::chrono::milliseconds(msec));
       f();
