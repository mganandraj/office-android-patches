diff --git a/E:/github/ms-react-native-forpatch/IntegrationTests/launchWebSocketServer.command b/E:/github/fb-react-native-forpatch/IntegrationTests/launchWebSocketServer.command
index a7c7ef25c..1ce2cf531 100644
--- a/E:/github/ms-react-native-forpatch/IntegrationTests/launchWebSocketServer.command
+++ b/E:/github/fb-react-native-forpatch/IntegrationTests/launchWebSocketServer.command
@@ -11,12 +11,8 @@ clear
 
 THIS_DIR=$(cd -P "$(dirname "$(readlink "${BASH_SOURCE[0]}" || echo "${BASH_SOURCE[0]}")")" && pwd)
 pushd "$THIS_DIR"
-./websocket_integration_test_server.js 2>&1 | tee -a "${LOG_FILE}"
+./websocket_integration_test_server.js
 popd
 
-endLog
-
-if [ "$SERVERS_NO_WAIT" != "1" ]; then
-  echo "Process terminated. Press <enter> to close the window"
-  read
-fi
\ No newline at end of file
+echo "Process terminated. Press <enter> to close the window"
+read
