diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/jsi/jsi/instrumentation.h b/E:/github/fb-react-native-forpatch/ReactCommon/jsi/jsi/instrumentation.h
index fb75456e3..f10fb69fb 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/jsi/jsi/instrumentation.h
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/jsi/jsi/instrumentation.h
@@ -6,7 +6,6 @@
  */
 #pragma once
 
-#include <iosfwd>
 #include <string>
 
 #include <jsi/jsi.h>
@@ -56,15 +55,6 @@ class Instrumentation {
   /// \return true iff the heap capture succeeded
   virtual bool createSnapshotToFile(const std::string& path, bool compact) = 0;
 
-  /// Captures the heap to an output stream
-  ///
-  /// \param os output stream to write to.
-  ///
-  /// \param compact Whether the JSON should be compact or pretty
-  ///
-  /// \return true iff the heap capture succeeded.
-  virtual bool createSnapshotToStream(std::ostream& os, bool compact) = 0;
-
   /// Write a trace of bridge traffic to the given file name.
   virtual void writeBridgeTrafficTraceToFile(
       const std::string& fileName) const = 0;
