diff --git "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\DatePickerAndroidExample.js" "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\DatePickerAndroidExample.js"
index 23f16cb..1b4f56b 100644
--- "a/E:\\github\\fb-react-native-forpatch-base\\RNTester\\js\\DatePickerAndroidExample.js"
+++ "b/E:\\github\\ms-react-native-forpatch\\RNTester\\js\\DatePickerAndroidExample.js"
@@ -68,8 +68,9 @@ class DatePickerAndroidExample extends React.Component<Props, State> {
         newState[stateKey + 'Date'] = date;
       }
       this.setState(newState);
-    } catch ({code, message}) {
-      console.warn(`Error in example '${stateKey}': `, message);
+      // Change here can go away once we sync to 0.57
+    } catch (err) {
+      console.warn(`Error in example '${stateKey}': `, err.message);
     }
   };
 
