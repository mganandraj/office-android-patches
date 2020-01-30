diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/jsi/jsi/jsi.cpp b/E:/github/fb-react-native-forpatch/ReactCommon/jsi/jsi/jsi.cpp
index aad96f17a..719dd9310 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/jsi/jsi/jsi.cpp
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/jsi/jsi/jsi.cpp
@@ -81,10 +81,6 @@ Instrumentation& Runtime::instrumentation() {
       return false;
     }
 
-    bool createSnapshotToStream(std::ostream&, bool) override {
-      return false;
-    }
-    
     void writeBridgeTrafficTraceToFile(const std::string&) const override {
       std::abort();
     }
