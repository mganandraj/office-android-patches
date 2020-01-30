diff --git a/E:/github/ms-react-native-forpatch/RNTester/js/DatePickerIOSExample.js b/E:/github/fb-react-native-forpatch/RNTester/js/DatePickerIOSExample.js
index 582b0305c..6aef85f21 100644
--- a/E:/github/ms-react-native-forpatch/RNTester/js/DatePickerIOSExample.js
+++ b/E:/github/fb-react-native-forpatch/RNTester/js/DatePickerIOSExample.js
@@ -32,13 +32,7 @@ class WithDatePickerData extends React.Component<Props, State> {
 
   render() {
     return (
-      <View
-        style={{
-          flex: 1,
-          justifyContent: 'center',
-          alignItems: 'center',
-          backgroundColor: 'gray',
-        }}>
+      <View>
         <WithLabel label="Value:">
           <Text testID="date-indicator">
             {this.state.date.toLocaleDateString()}
