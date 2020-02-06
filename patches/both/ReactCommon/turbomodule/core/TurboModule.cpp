--- "E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\turbomodule\\core\\TurboModule.cpp"	2020-01-30 13:55:48.615614300 -0800
+++ "E:\\github\\ms-react-native-forpatch\\ReactCommon\\turbomodule\\core\\TurboModule.cpp"	2020-01-29 14:10:09.835893700 -0800
@@ -29,7 +29,7 @@
   return jsi::Function::createFromHostFunction(
     runtime,
     propName,
-    meta.argCount,
+    static_cast<unsigned int>(meta.argCount),
     [this, meta](facebook::jsi::Runtime &rt, const facebook::jsi::Value &thisVal, const facebook::jsi::Value *args, size_t count) {
       return meta.invoker(rt, *this, args, count);
     });
