--- "e:\\github\\fb-react-native-forpatch-base\\scripts\\Launch-Packager.ps1"	1969-12-31 16:00:00.000000000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\scripts\\Launch-Packager.ps1"	2020-01-29 14:10:10.014924300 -0800
@@ -0,0 +1,16 @@
+param(
+	[int] $WindowWidth = 0,
+	[int] $WindowHeight = 0
+)
+
+if (0 -lt $WindowWidth -and 0 -lt $WindowHeight) {
+	[Console]::WindowWidth = $WindowWidth
+	[Console]::WindowHeight = $WindowHeight
+	[Console]::BufferWidth = $WindowWidth
+}
+
+Write-Host 'React Packager'
+Clear-Host
+
+$root = Split-Path $PSScriptRoot
+node.exe $root\local-cli\cli.js start $args
\ No newline at end of file
