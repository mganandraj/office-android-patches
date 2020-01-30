diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/turbomodule/core/TurboModule.cpp b/E:/github/fb-react-native-forpatch/ReactCommon/turbomodule/core/TurboModule.cpp
index 30bd033f1..352bb7a8b 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/turbomodule/core/TurboModule.cpp
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/turbomodule/core/TurboModule.cpp
@@ -29,7 +29,7 @@ jsi::Value TurboModule::get(jsi::Runtime& runtime, const jsi::PropNameID& propNa
   return jsi::Function::createFromHostFunction(
     runtime,
     propName,
-    static_cast<unsigned int>(meta.argCount),
+    meta.argCount,
     [this, meta](facebook::jsi::Runtime &rt, const facebook::jsi::Value &thisVal, const facebook::jsi::Value *args, size_t count) {
       return meta.invoker(rt, *this, args, count);
     });
