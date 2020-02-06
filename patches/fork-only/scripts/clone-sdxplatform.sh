--- "E:\\github\\fb-react-native-forpatch-base\\scripts\\clone-sdxplatform.sh"	1969-12-31 16:00:00.000000000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\scripts\\clone-sdxplatform.sh"	2020-01-29 14:10:10.017894800 -0800
@@ -0,0 +1,9 @@
+echo $AGENT_BUILDDIRECTORY
+
+SDX_PATH=$AGENT_BUILDDIRECTORY/sdx
+
+echo $SDX_PATH
+
+rm -rf $SDX_PATH
+
+git -c http.https://office.visualstudio.com.extraheader="AUTHORIZATION: bearer $SYSTEM_ACCESSTOKEN" clone https://office.visualstudio.com/ISS/_git/sdx-platform $SDX_PATH
\ No newline at end of file
