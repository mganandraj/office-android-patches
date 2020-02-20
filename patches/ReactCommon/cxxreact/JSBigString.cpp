--- "e:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\JSBigString.cpp"	2020-01-30 13:55:48.515581300 -0800
+++ "e:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\JSBigString.cpp"	2020-02-19 16:54:00.812087200 -0800
@@ -7,6 +7,7 @@
 
 #include <fcntl.h>
 #include <sys/stat.h>
+#include <unistd.h>
 
 #include <glog/logging.h>
 
