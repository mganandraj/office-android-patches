diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/MethodCall.cpp b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/MethodCall.cpp
index 1e4a7564f..7141513d1 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/MethodCall.cpp
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/MethodCall.cpp
@@ -64,12 +64,12 @@ std::vector<MethodCall> parseMethodCalls(folly::dynamic&& jsonData) {
     }
 
     methodCalls.emplace_back(
-      static_cast<int>(moduleIds[i].asInt()),
-      static_cast<int>(methodIds[i].asInt()),
+      moduleIds[i].asInt(),
+      methodIds[i].asInt(),
       std::move(params[i]),
       callId);
 
-    // only increment callid if contains valid callid as callid is optional
+    // only incremement callid if contains valid callid as callid is optional
     callId += (callId != -1) ? 1 : 0;
   }
 
