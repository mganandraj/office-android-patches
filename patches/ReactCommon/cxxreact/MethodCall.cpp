--- "e:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\MethodCall.cpp"	2020-01-30 13:55:48.519581000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\MethodCall.cpp"	2020-02-20 11:21:17.379512600 -0800
@@ -64,8 +64,8 @@
     }
 
     methodCalls.emplace_back(
-      moduleIds[i].asInt(),
-      methodIds[i].asInt(),
+      static_cast<int>(moduleIds[i].asInt()),
+      static_cast<int>(methodIds[i].asInt()),
       std::move(params[i]),
       callId);
 
