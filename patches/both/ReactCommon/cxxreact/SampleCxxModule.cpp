--- "E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\SampleCxxModule.cpp"	2020-01-30 13:55:48.522580900 -0800
+++ "E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\SampleCxxModule.cpp"	2020-01-29 14:10:09.754922800 -0800
@@ -28,9 +28,9 @@
   return a + b;
 }
 
-std::string Sample::repeat(int count, const std::string& str) {
+std::string Sample::repeat(int64_t count, const std::string& str) {
   std::string ret;
-  for (int i = 0; i < count; i++) {
+  for (int64_t i = 0; i < count; i++) {
     ret += str;
   }
 
@@ -52,7 +52,7 @@
   // throw std::runtime_error("oops");
 }
 
-void Sample::call_later(int msec, std::function<void()> f) {
+void Sample::call_later(int64_t msec, std::function<void()> f) {
   std::thread t([=] {
       std::this_thread::sleep_for(std::chrono::milliseconds(msec));
       f();
