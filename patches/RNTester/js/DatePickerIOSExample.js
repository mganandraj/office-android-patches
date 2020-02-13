--- "e:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\DatePickerIOSExample.js"	2020-01-30 13:55:48.075613000 -0800
+++ "e:\\github\\ms-react-native-forpatch\\RNTester\\js\\DatePickerIOSExample.js"	2020-01-29 14:10:09.169892300 -0800
@@ -32,7 +32,13 @@
 
   render() {
     return (
-      <View>
+      <View
+        style={{
+          flex: 1,
+          justifyContent: 'center',
+          alignItems: 'center',
+          backgroundColor: 'gray',
+        }}>
         <WithLabel label="Value:">
           <Text testID="date-indicator">
             {this.state.date.toLocaleDateString()}
