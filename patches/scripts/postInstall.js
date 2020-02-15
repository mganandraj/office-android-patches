--- "e:\\github\\fb-react-native-forpatch-base\\scripts\\postInstall.js"	1969-12-31 16:00:00.000000000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\scripts\\postInstall.js"	2020-02-13 14:18:01.603280700 -0800
@@ -0,0 +1,6 @@
+const child_process = require('child_process');
+
+const isMacOS = process.platform === 'darwin';
+if (isMacOS) {
+  child_process.execSync('source scripts/fixmacscripts.sh', {stdio: 'inherit'});
+}
