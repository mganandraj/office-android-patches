--- "E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\MethodCall.cpp"	2020-01-30 13:55:48.519581000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\MethodCall.cpp"	2020-01-29 14:10:09.750922100 -0800
@@ -64,12 +64,12 @@
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
 
