diff --git "a/E:\\github\\fb-react-native-forpatch-base\\scripts\\ios-install-third-party.sh" "b/E:\\github\\ms-react-native-forpatch\\scripts\\ios-install-third-party.sh"
index 6638acb..26b49e1 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\scripts\\ios-install-third-party.sh"
+++ "b/E:\\github\\ms-react-native-forpatch\\scripts\\ios-install-third-party.sh"
@@ -71,7 +71,19 @@ mkdir -p third-party
 
 SCRIPTDIR=$(dirname "$0")
 
-fetch_and_unpack glog-0.3.5.tar.gz https://github.com/google/glog/archive/v0.3.5.tar.gz 61067502c5f9769d111ea1ee3f74e6ddf0a5f9cc "\"$SCRIPTDIR/ios-configure-glog.sh\""
+# TODO: temporarily use our stubbed version of glog/logging.h until glog is updated to not use the Binscope banned APIs sscanf() and strncpy().
+# Fb changed to copy into exported instead of src
+glogdir=third-party/glog-0.3.5/exported/glog
+glogdir2=third-party/glog-0.3.5/src/glog
+
+if [ ! -d "$glogdir" ]; then
+    mkdir -p $glogdir
+    cp stubs/glog/logging.h $glogdir
+	mkdir -p $glogdir2
+    cp stubs/glog/logging.h $glogdir2
+fi
+# fetch_and_unpack glog-0.3.5.tar.gz https://github.com/google/glog/archive/v0.3.5.tar.gz 61067502c5f9769d111ea1ee3f74e6ddf0a5f9cc "\"$SCRIPTDIR/ios-configure-glog.sh\""
+
 fetch_and_unpack double-conversion-1.1.6.tar.gz https://github.com/google/double-conversion/archive/v1.1.6.tar.gz 1c7d88afde3aaeb97bb652776c627b49e132e8e0
 fetch_and_unpack boost_1_63_0.tar.gz https://github.com/react-native-community/boost-for-react-native/releases/download/v1.63.0-0/boost_1_63_0.tar.gz c3f57e1d22a995e608983effbb752b54b6eab741
 fetch_and_unpack folly-2018.10.22.00.tar.gz https://github.com/facebook/folly/archive/v2018.10.22.00.tar.gz f70a75bfeb394363d2049a846bba118ffb3b368a
