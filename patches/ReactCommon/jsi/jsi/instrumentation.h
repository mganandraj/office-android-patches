--- "e:\\github\\fb-react-native-forpatch-base\\ReactCommon\\jsi\\jsi\\instrumentation.h"	2020-01-30 13:55:48.607617600 -0800
+++ "e:\\github\\ms-react-native-forpatch\\ReactCommon\\jsi\\jsi\\instrumentation.h"	2020-01-29 14:10:09.828890800 -0800
@@ -6,6 +6,7 @@
  */
 #pragma once
 
+#include <iosfwd>
 #include <string>
 
 #include <jsi/jsi.h>
@@ -55,6 +56,15 @@
   /// \return true iff the heap capture succeeded
   virtual bool createSnapshotToFile(const std::string& path, bool compact) = 0;
 
+  /// Captures the heap to an output stream
+  ///
+  /// \param os output stream to write to.
+  ///
+  /// \param compact Whether the JSON should be compact or pretty
+  ///
+  /// \return true iff the heap capture succeeded.
+  virtual bool createSnapshotToStream(std::ostream& os, bool compact) = 0;
+
   /// Write a trace of bridge traffic to the given file name.
   virtual void writeBridgeTrafficTraceToFile(
       const std::string& fileName) const = 0;
