diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/CxxModule.h b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/CxxModule.h
index f6a1ab234..5a4d330e6 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/CxxModule.h
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/CxxModule.h
@@ -12,6 +12,8 @@
 
 #include <folly/dynamic.h>
 
+using namespace std::placeholders;
+
 namespace facebook {
 namespace react {
 
