--- "E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\jsi\\jsi\\jsi.cpp"	2020-01-30 13:55:48.608616800 -0800
+++ "E:\\github\\ms-react-native-forpatch\\ReactCommon\\jsi\\jsi\\jsi.cpp"	2020-01-29 14:10:09.828890800 -0800
@@ -81,6 +81,10 @@
       return false;
     }
 
+    bool createSnapshotToStream(std::ostream&, bool) override {
+      return false;
+    }
+    
     void writeBridgeTrafficTraceToFile(const std::string&) const override {
       std::abort();
     }
