--- "E:\\github\\fb-react-native-forpatch-base\\ContainerShip\\scripts\\run-android-docker-instrumentation-specific-tests.bat"	1969-12-31 16:00:00.000000000 -0800
+++ "E:\\github\\ms-react-native-forpatch\\ContainerShip\\scripts\\run-android-docker-instrumentation-specific-tests.bat"	2020-01-29 14:10:08.455894600 -0800
@@ -0,0 +1,4 @@
+echo Executing ReactNative Integrations tests given in the filter
+docker run --cap-add=SYS_ADMIN -i react/android bash ContainerShip/scripts/run-android-docker-instrumentation-tests.sh --filter="(CatalystMeasureLayout|CatalystMultitouchHandling|CatalystNativeJSToJavaParameters|CatalystNativeJavaToJSArguments|CatalystNativeJavaToJSReturnValues|CatalystSubviewsClipping|CatalystTouchBubbling|DatePickerDialog|InitialProps|JSResponder|LayoutEvents|NativeId|ReactPicker|ReactRootView|ReactSwipeRefreshLayout|Share|TestId|TextInput|TimePickerDialog)"
+
+
