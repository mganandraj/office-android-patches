--- "E:\\github\\fb-react-native-forpatch-base\\ReactCommon\\jsi\\jsi\\jsi.h"	2020-01-30 13:55:48.608616800 -0800
+++ "E:\\github\\ms-react-native-forpatch\\ReactCommon\\jsi\\jsi\\jsi.h"	2020-01-29 14:10:09.829890800 -0800
@@ -150,7 +150,7 @@
 
   /// Evaluates the given JavaScript \c buffer.  \c sourceURL is used
   /// to annotate the stack trace if there is an exception.  The
-  /// contents may be utf8-encoded JS source code, or binary bytcode
+  /// contents may be utf8-encoded JS source code, or binary bytecode
   /// whose format is specific to the implementation.  If the input
   /// format is unknown, or evaluation causes an error, a JSIException
   /// will be thrown.
@@ -347,7 +347,7 @@
   using Pointer::Pointer;
 
   PropNameID(Runtime& runtime, const PropNameID& other)
-      : PropNameID(runtime.clonePropNameID(other.ptr_)) {}
+      : Pointer(runtime.clonePropNameID(other.ptr_)) {}
 
   PropNameID(PropNameID&& other) = default;
   PropNameID& operator=(PropNameID&& other) = default;
@@ -745,7 +745,7 @@
   template <typename... Args>
   static Array createWithElements(Runtime&, Args&&... args);
 
-  /// Creates a new Array instance from intitializer list.
+  /// Creates a new Array instance from initializer list.
   static Array createWithElements(
       Runtime& runtime,
       std::initializer_list<Value> elements);
