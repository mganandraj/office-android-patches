diff --git "a/E:\\github\\fb-react-native-forpatch-base\\IntegrationTests\\launchWebSocketServer.command" "b/E:\\github\\ms-react-native-forpatch\\IntegrationTests\\launchWebSocketServer.command"
index 1ce2cf5..a7c7ef2 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\IntegrationTests\\launchWebSocketServer.command"
+++ "b/E:\\github\\ms-react-native-forpatch\\IntegrationTests\\launchWebSocketServer.command"
@@ -11,8 +11,12 @@ clear
 
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
