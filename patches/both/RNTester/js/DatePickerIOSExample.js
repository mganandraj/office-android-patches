diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\DatePickerIOSExample.js" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\DatePickerIOSExample.js"
index 6aef85f..582b030 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\DatePickerIOSExample.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\DatePickerIOSExample.js"
@@ -32,7 +32,13 @@ class WithDatePickerData extends React.Component<Props, State> {
 
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
