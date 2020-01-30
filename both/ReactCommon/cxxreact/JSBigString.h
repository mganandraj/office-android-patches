diff --git a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/JSBigString.h b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/JSBigString.h
index 4dfb7aeff..c4bf86fd7 100644
--- a/E:/github/ms-react-native-forpatch/ReactCommon/cxxreact/JSBigString.h
+++ b/E:/github/fb-react-native-forpatch/ReactCommon/cxxreact/JSBigString.h
@@ -6,6 +6,7 @@
 #pragma once
 
 #include <fcntl.h>
+#include <unistd.h>
 #include <sys/mman.h>
 
 #include <folly/Exception.h>
@@ -28,7 +29,7 @@ namespace react {
 // large string needs to be curried into a std::function<>, which must
 // by CopyConstructible.
 
-class RN_EXPORT JSBigString {
+class JSBigString {
 public:
   JSBigString() = default;
 
@@ -51,7 +52,7 @@ public:
 // instance.
 class JSBigStdString : public JSBigString {
 public:
-  JSBigStdString(std::string str, bool isAscii = false)
+  JSBigStdString(std::string str, bool isAscii=false)
   : m_isAscii(isAscii)
   , m_str(std::move(str)) {}
 
@@ -90,8 +91,7 @@ public:
     delete[] m_data;
   }
 
-  bool isAscii() const override
-  {
+  bool isAscii() const override {
     return true;
   }
 
@@ -115,6 +115,7 @@ private:
 // JSBigString interface implemented by a file-backed mmap region.
 class RN_EXPORT JSBigFileString : public JSBigString {
 public:
+
   JSBigFileString(int fd, size_t size, off_t offset = 0);
   ~JSBigFileString();
 
@@ -129,12 +130,12 @@ public:
 
   static std::unique_ptr<const JSBigFileString> fromPath(const std::string& sourceURL);
 
-private :
+private:
   int m_fd;                     // The file descriptor being mmaped
   size_t m_size;                // The size of the mmaped region
   mutable off_t m_pageOff;      // The offset in the mmaped region to the data.
   off_t m_mapOff;               // The offset in the file to the mmaped region.
-  mutable const char* m_data;   // Pointer to the mmaped region.
+  mutable const char *m_data;   // Pointer to the mmaped region.
 };
 
 } }
