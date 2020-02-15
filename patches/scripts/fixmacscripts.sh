--- "e:\\github\\fb-react-native-forpatch-base\\scripts\\fixmacscripts.sh"	1969-12-31 16:00:00.000000000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\scripts\\fixmacscripts.sh"	2020-02-13 14:18:01.602280800 -0800
@@ -0,0 +1,9 @@
+#!/bin/sh
+
+# npm publish is currently performed on Windows build agents and loses the executable bit on files.
+# restore the executable bit during npm postinstall
+
+echo "Fixing the executable bit on macOS scripts"
+
+find . -iname \*.sh -exec chmod +x {} \;
+find . -iname \*.command -exec chmod +x {} \;
