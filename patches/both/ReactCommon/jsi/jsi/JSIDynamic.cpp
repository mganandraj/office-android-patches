diff --git "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\jsi\\jsi\\JSIDynamic.cpp" "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\jsi\\jsi\\JSIDynamic.cpp"
index f63254e..f275dfb 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\jsi\\jsi\\JSIDynamic.cpp"
+++ "b/E:\\github\\ms-react-native-forpatch\\ReactCommon\\jsi\\jsi\\JSIDynamic.cpp"
@@ -18,36 +18,39 @@ namespace jsi {
 
 Value valueFromDynamic(Runtime& runtime, const folly::dynamic& dyn) {
   switch (dyn.type()) {
-  case folly::dynamic::NULLT:
-    return Value::null();
-  case folly::dynamic::ARRAY: {
-    Array ret = Array(runtime, dyn.size());
-    for (size_t i = 0; i < dyn.size(); ++i) {
-      ret.setValueAtIndex(runtime, i, valueFromDynamic(runtime, dyn[i]));
+    case folly::dynamic::NULLT:
+      return Value::null();
+    case folly::dynamic::ARRAY: {
+      Array ret = Array(runtime, dyn.size());
+      for (size_t i = 0; i < dyn.size(); ++i) {
+        ret.setValueAtIndex(runtime, i, valueFromDynamic(runtime, dyn[i]));
+      }
+      return std::move(ret);
     }
-    return std::move(ret);
-  }
-  case folly::dynamic::BOOL:
-    return dyn.getBool();
-  case folly::dynamic::DOUBLE:
-    return dyn.getDouble();
-  case folly::dynamic::INT64:
-    // Can't use asDouble() here.  If the int64 value is too bit to be
-    // represented precisely as a double, folly will throw an
-    // exception.
-    return (double)dyn.getInt();
-  case folly::dynamic::OBJECT: {
-    Object ret(runtime);
-    for (const auto& element : dyn.items()) {
-      Value value = valueFromDynamic(runtime, element.second);
-      if (element.first.isNumber() || element.first.isString()) {
-        ret.setProperty(runtime, element.first.asString().c_str(), value);
+    case folly::dynamic::BOOL:
+      return dyn.getBool();
+    case folly::dynamic::DOUBLE:
+      return dyn.getDouble();
+    case folly::dynamic::INT64:
+      // Can't use asDouble() here.  If the int64 value is too bit to be
+      // represented precisely as a double, folly will throw an
+      // exception.
+      return (double)dyn.getInt();
+    case folly::dynamic::OBJECT: {
+      Object ret(runtime);
+      for (const auto& element : dyn.items()) {
+        Value value = valueFromDynamic(runtime, element.second);
+        if (element.first.isNumber() || element.first.isString()) {
+          ret.setProperty(
+              runtime,
+              PropNameID::forUtf8(runtime, element.first.asString()),
+              value);
+        }
       }
+      return std::move(ret);
     }
-    return std::move(ret);
-  }
-  case folly::dynamic::STRING:
-    return String::createFromUtf8(runtime, dyn.getString());
+    case folly::dynamic::STRING:
+      return String::createFromUtf8(runtime, dyn.getString());
   }
   CHECK(false);
 }
@@ -67,7 +70,8 @@ folly::dynamic dynamicFromValue(Runtime& runtime, const Value& value) {
       Array array = obj.getArray(runtime);
       folly::dynamic ret = folly::dynamic::array();
       for (size_t i = 0; i < array.size(runtime); ++i) {
-        ret.push_back(dynamicFromValue(runtime, array.getValueAtIndex(runtime, i)));
+        ret.push_back(
+            dynamicFromValue(runtime, array.getValueAtIndex(runtime, i)));
       }
       return ret;
     } else if (obj.isFunction(runtime)) {
@@ -95,5 +99,5 @@ folly::dynamic dynamicFromValue(Runtime& runtime, const Value& value) {
   }
 }
 
-}
-}
+} // namespace jsi
+} // namespace facebook
