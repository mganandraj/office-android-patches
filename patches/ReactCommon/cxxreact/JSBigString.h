--- "e:\\github\\fb-react-native-forpatch-base\\ReactCommon\\cxxreact\\JSBigString.h"	2020-01-30 13:55:48.515581300 -0800
+++ "e:\\github\\ms-react-native-forpatch\\ReactCommon\\cxxreact\\JSBigString.h"	2020-01-29 14:10:09.748923000 -0800
@@ -6,7 +6,6 @@
 #pragma once
 
 #include <fcntl.h>
-#include <unistd.h>
 #include <sys/mman.h>
 
 #include <folly/Exception.h>
@@ -29,7 +28,7 @@
 // large string needs to be curried into a std::function<>, which must
 // by CopyConstructible.
 
-class JSBigString {
+class RN_EXPORT JSBigString {
 public:
   JSBigString() = default;
 
@@ -52,7 +51,7 @@
 // instance.
 class JSBigStdString : public JSBigString {
 public:
-  JSBigStdString(std::string str, bool isAscii=false)
+  JSBigStdString(std::string str, bool isAscii = false)
   : m_isAscii(isAscii)
   , m_str(std::move(str)) {}
 
@@ -91,7 +90,8 @@
     delete[] m_data;
   }
 
-  bool isAscii() const override {
+  bool isAscii() const override
+  {
     return true;
   }
 
@@ -115,7 +115,6 @@
 // JSBigString interface implemented by a file-backed mmap region.
 class RN_EXPORT JSBigFileString : public JSBigString {
 public:
-
   JSBigFileString(int fd, size_t size, off_t offset = 0);
   ~JSBigFileString();
 
@@ -130,12 +129,12 @@
 
   static std::unique_ptr<const JSBigFileString> fromPath(const std::string& sourceURL);
 
-private:
+private :
   int m_fd;                     // The file descriptor being mmaped
   size_t m_size;                // The size of the mmaped region
   mutable off_t m_pageOff;      // The offset in the mmaped region to the data.
   off_t m_mapOff;               // The offset in the file to the mmaped region.
-  mutable const char *m_data;   // Pointer to the mmaped region.
+  mutable const char* m_data;   // Pointer to the mmaped region.
 };
 
 } }
