diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\jsi\\jsi\\jsi.cpp" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\jsi\\jsi\\jsi.cpp"
index 719dd93..aad96f1 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\jsi\\jsi\\jsi.cpp"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\jsi\\jsi\\jsi.cpp"
@@ -81,6 +81,10 @@ Instrumentation& Runtime::instrumentation() {
       return false;
     }
 
+    bool createSnapshotToStream(std::ostream&, bool) override {
+      return false;
+    }
+    
     void writeBridgeTrafficTraceToFile(const std::string&) const override {
       std::abort();
     }
