--- "E:\\github\\fb-react-native-forpatch-base\\ContainerShip\\scripts\\CleanUpDocker.bat"	1969-12-31 16:00:00.000000000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\ContainerShip\\scripts\\CleanUpDocker.bat"	2020-01-29 14:10:08.455894600 -0800
@@ -0,0 +1,5 @@
+echo Removing stopped containers
+FOR /f "tokens=*" %%i IN ('docker ps -a -q') DO docker rm %%i
+
+echo Now removing the images.
+FOR /f "tokens=*" %%i IN ('docker images -f "dangling=true" -q') DO docker rmi %%i
