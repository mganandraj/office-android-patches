diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/jsi/jsi/jsi.h b/E:/github/fb-react-native-forpatch/ReactCommon/jsi/jsi/jsi.h
index b172b5b5a..14334d2c4 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/jsi/jsi/jsi.h
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/jsi/jsi/jsi.h
@@ -150,7 +150,7 @@ class Runtime {
 
   /// Evaluates the given JavaScript \c buffer.  \c sourceURL is used
   /// to annotate the stack trace if there is an exception.  The
-  /// contents may be utf8-encoded JS source code, or binary bytecode
+  /// contents may be utf8-encoded JS source code, or binary bytcode
   /// whose format is specific to the implementation.  If the input
   /// format is unknown, or evaluation causes an error, a JSIException
   /// will be thrown.
@@ -347,7 +347,7 @@ class PropNameID : public Pointer {
   using Pointer::Pointer;
 
   PropNameID(Runtime& runtime, const PropNameID& other)
-      : Pointer(runtime.clonePropNameID(other.ptr_)) {}
+      : PropNameID(runtime.clonePropNameID(other.ptr_)) {}
 
   PropNameID(PropNameID&& other) = default;
   PropNameID& operator=(PropNameID&& other) = default;
@@ -745,7 +745,7 @@ class Array : public Object {
   template <typename... Args>
   static Array createWithElements(Runtime&, Args&&... args);
 
-  /// Creates a new Array instance from initializer list.
+  /// Creates a new Array instance from intitializer list.
   static Array createWithElements(
       Runtime& runtime,
       std::initializer_list<Value> elements);
