diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\turbomodule\\core\\TurboModule.cpp" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\turbomodule\\core\\TurboModule.cpp"
index 352bb7a..30bd033 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\turbomodule\\core\\TurboModule.cpp"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\turbomodule\\core\\TurboModule.cpp"
@@ -29,7 +29,7 @@ jsi::Value TurboModule::get(jsi::Runtime& runtime, const jsi::PropNameID& propNa
   return jsi::Function::createFromHostFunction(
     runtime,
     propName,
-    meta.argCount,
+    static_cast<unsigned int>(meta.argCount),
     [this, meta](facebook::jsi::Runtime &rt, const facebook::jsi::Value &thisVal, const facebook::jsi::Value *args, size_t count) {
       return meta.invoker(rt, *this, args, count);
     });
