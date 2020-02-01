diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\MethodCall.cpp" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\MethodCall.cpp"
index 7141513..1e4a756 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\MethodCall.cpp"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\MethodCall.cpp"
@@ -64,12 +64,12 @@ std::vector<MethodCall> parseMethodCalls(folly::dynamic&& jsonData) {
     }
 
     methodCalls.emplace_back(
-      moduleIds[i].asInt(),
-      methodIds[i].asInt(),
+      static_cast<int>(moduleIds[i].asInt()),
+      static_cast<int>(methodIds[i].asInt()),
       std::move(params[i]),
       callId);
 
-    // only incremement callid if contains valid callid as callid is optional
+    // only increment callid if contains valid callid as callid is optional
     callId += (callId != -1) ? 1 : 0;
   }
 
