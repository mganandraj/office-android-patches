--- "e:\\github\\fb-react-native-forpatch-base\\IntegrationTests\\launchWebSocketServer.command"	2020-01-29 14:11:25.811520300 -0800
+++ "e:\\github\\ms-react-native-forpatch\\IntegrationTests\\launchWebSocketServer.command"	2020-01-29 14:10:08.791913200 -0800
@@ -11,8 +11,12 @@
 
 THIS_DIR=$(cd -P "$(dirname "$(readlink "${BASH_SOURCE[0]}" || echo "${BASH_SOURCE[0]}")")" && pwd)
 pushd "$THIS_DIR"
-./websocket_integration_test_server.js
+./websocket_integration_test_server.js 2>&1 | tee -a "${LOG_FILE}"
 popd
 
-echo "Process terminated. Press <enter> to close the window"
-read
+endLog
+
+if [ "$SERVERS_NO_WAIT" != "1" ]; then
+  echo "Process terminated. Press <enter> to close the window"
+  read
+fi
\ No newline at end of file
