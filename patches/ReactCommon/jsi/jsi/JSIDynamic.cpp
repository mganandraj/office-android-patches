--- "e:\\github\\fb-react-native-forpatch-base\\ReactCommon\\jsi\\jsi\\JSIDynamic.cpp"	2020-01-30 13:55:48.606614400 -0800
+++ "e:\\github\\ms-react-native-forpatch\\ReactCommon\\jsi\\jsi\\JSIDynamic.cpp"	2020-01-29 14:10:09.827891300 -0800
@@ -18,36 +18,39 @@
 
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
@@ -67,7 +70,8 @@
       Array array = obj.getArray(runtime);
       folly::dynamic ret = folly::dynamic::array();
       for (size_t i = 0; i < array.size(runtime); ++i) {
-        ret.push_back(dynamicFromValue(runtime, array.getValueAtIndex(runtime, i)));
+        ret.push_back(
+            dynamicFromValue(runtime, array.getValueAtIndex(runtime, i)));
       }
       return ret;
     } else if (obj.isFunction(runtime)) {
@@ -95,5 +99,5 @@
   }
 }
 
-}
-}
+} // namespace jsi
+} // namespace facebook
