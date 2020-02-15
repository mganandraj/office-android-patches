--- "e:\\github\\fb-react-native-forpatch-base\\scripts\\vsto-test-setup.sh"	1969-12-31 16:00:00.000000000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\scripts\\vsto-test-setup.sh"	2020-02-13 14:18:01.605280500 -0800
@@ -0,0 +1,12 @@
+#!/bin/bash
+set -ex
+
+# Script used by the VSTO build agent to start the packager and web socket server
+
+THIS_DIR=$PWD
+
+# Start the packager
+osascript -e "tell application \"Terminal\" to do script \"cd ${THIS_DIR}; export SERVERS_NO_WAIT=1; ./scripts/launchPackager.command\""
+
+# Start the WebSocket test server
+osascript -e "tell application \"Terminal\" to do script \"cd ${THIS_DIR}; export SERVERS_NO_WAIT=1; ./IntegrationTests/launchWebSocketServer.command\""
