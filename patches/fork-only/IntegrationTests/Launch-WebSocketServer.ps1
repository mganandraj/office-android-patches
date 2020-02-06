--- "E:\\github\\fb-react-native-forpatch-base\\IntegrationTests\\Launch-WebSocketServer.ps1"	1969-12-31 16:00:00.000000000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\IntegrationTests\\Launch-WebSocketServer.ps1"	2020-01-29 14:10:08.789911700 -0800
@@ -0,0 +1,18 @@
+param(
+	[int] $WindowWidth = 0,
+	[int] $WindowHeight = 0,
+  [string] $File = 'websocket_integration_test_server.js'
+)
+
+if (0 -lt $WindowWidth -and 0 -lt $WindowHeight) {
+	[Console]::WindowWidth = $WindowWidth
+	[Console]::WindowHeight = $WindowHeight
+	[Console]::BufferWidth = $WindowWidth
+}
+
+Write-Host "Web Socket Test Server"
+Clear-Host
+
+Push-Location $PSScriptRoot
+node.exe $File
+Pop-Location
